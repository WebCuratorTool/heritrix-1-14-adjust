/*
 * ARCWriter
 *
 * $Id: ARCWriterProcessor.java 5478 2007-09-19 01:37:07Z gojomo $
 *
 * Created on Jun 5, 2003
 *
 * Copyright (C) 2003 Internet Archive.
 *
 * This file is part of the Heritrix web crawler (crawler.archive.org).
 *
 * Heritrix is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or
 * any later version.
 *
 * Heritrix is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser Public License for more details.
 *
 * You should have received a copy of the GNU Lesser Public License
 * along with Heritrix; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
package org.archive.crawler.writer;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.xml.transform.SourceLocator;
import javax.xml.transform.Templates;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.commons.io.IOUtils;
import org.archive.crawler.Heritrix;
import org.archive.crawler.datamodel.CoreAttributeConstants;
import org.archive.crawler.datamodel.CrawlURI;
import org.archive.crawler.datamodel.FetchStatusCodes;
import org.archive.crawler.event.CrawlStatusListener;
import org.archive.crawler.framework.WriterPoolProcessor;
import org.archive.crawler.settings.XMLSettingsHandler;
import org.archive.io.ReplayInputStream;
import org.archive.io.WriterPoolMember;
import org.archive.io.WriterPoolSettings;
import org.archive.io.arc.ARCConstants;
import org.archive.io.arc.ARCWriter;
import org.archive.io.arc.ARCWriterPool;


/**
 * Processor module for writing the results of successful fetches (and
 * perhaps someday, certain kinds of network failures) to the Internet Archive
 * ARC file format.
 *
 * Assumption is that there is only one of these ARCWriterProcessors per
 * Heritrix instance.
 *
 * @author Parker Thompson
 */
public class ARCWriterProcessor extends WriterPoolProcessor
implements CoreAttributeConstants, ARCConstants, CrawlStatusListener,
WriterPoolSettings, FetchStatusCodes {
	private static final long serialVersionUID = 1957518408532644531L;

	private final Logger logger = Logger.getLogger(this.getClass().getName());
    
    /**
     * Default path list.
     */
    private static final String [] DEFAULT_PATH = {"arcs"};

    /**
     * @param name Name of this writer.
     */
    public ARCWriterProcessor(String name) {
        super(name, "ARCWriter processor");
    }
    
    protected String [] getDefaultPath() {
    	return DEFAULT_PATH;
	}

    protected void setupPool(final AtomicInteger serialNo) {
		setPool(new ARCWriterPool(serialNo, this, getPoolMaximumActive(),
            getPoolMaximumWait()));
    }
    
    /**
     * Writes a CrawlURI and its associated data to store file.
     *
     * Currently this method understands the following uri types: dns, http, 
     * and https.
     *
     * @param curi CrawlURI to process.
     */
    protected void innerProcess(CrawlURI curi) {
        // If failure, or we haven't fetched the resource yet, return
        if (curi.getFetchStatus() <= 0) {
            return;
        }
        
        // If no recorded content at all, don't write record.
        long recordLength = curi.getHttpRecorder().getRecordedInput().getSize();
        if (recordLength <= 0) {
        	// getContentSize() should be > 0 if any material (even just
            // HTTP headers with zero-length body) is available. 
        	return;
        }
        
        ReplayInputStream ris = null; 
        try {
            if(shouldWrite(curi)) {
                ris = curi.getHttpRecorder().getRecordedInput()
                        .getReplayInputStream();
                write(curi, recordLength, ris, getHostAddress(curi));
            } else {
                logger.info("does not write " + curi.toString());
            }
        } catch (IOException e) {
            curi.addLocalizedError(this.getName(), e, "WriteRecord: " +
                curi.toString());
            logger.log(Level.SEVERE, "Failed write of Record: " +
                curi.toString(), e);
        } finally {
            IOUtils.closeQuietly(ris); 
        }
    }
    
    protected void write(CrawlURI curi, long recordLength, InputStream in,
        String ip)
    throws IOException {
        WriterPoolMember writer = getPool().borrowFile();
        long position = writer.getPosition();
        // See if we need to open a new file because we've exceeed maxBytes.
        // Call to checkFileSize will open new file if we're at maximum for
        // current file.
        writer.checkSize();
        if (writer.getPosition() != position) {
            // We just closed the file because it was larger than maxBytes.
            // Add to the totalBytesWritten the size of the first record
            // in the file, if any.
            setTotalBytesWritten(getTotalBytesWritten() +
            	(writer.getPosition() - position));
            position = writer.getPosition();
        }
        
        ARCWriter w = (ARCWriter)writer;
        try {
            if (in instanceof ReplayInputStream) {
                w.write(curi.toString(), curi.getContentType(),
                    ip, curi.getLong(A_FETCH_BEGAN_TIME),
                    recordLength, (ReplayInputStream)in);
            } else {
                w.write(curi.toString(), curi.getContentType(),
                    ip, curi.getLong(A_FETCH_BEGAN_TIME),
                    recordLength, in);
            }
        } catch (IOException e) {
            // Invalidate this file (It gets a '.invalid' suffix).
            getPool().invalidateFile(writer);
            // Set the writer to null otherwise the pool accounting
            // of how many active writers gets skewed if we subsequently
            // do a returnWriter call on this object in the finally block.
            writer = null;
            throw e;
        } finally {
            if (writer != null) {
            	setTotalBytesWritten(getTotalBytesWritten() +
            	     (writer.getPosition() - position));
                getPool().returnFile(writer);
            }
        }
        checkBytesWritten();
    }
    
    @Override
    protected String getFirstrecordStylesheet() {
        return "/arcMetaheaderBody.xsl";
    }
}