/* Copyright (C) 2003 Internet Archive.
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
 *
 * Created on Nov 17, 2003
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package org.archive.crawler.extractor;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;

import org.apache.commons.codec.DecoderException;
import org.apache.commons.httpclient.heritrix.LaxURLCodec;
import org.apache.commons.httpclient.URIException;
import org.archive.crawler.datamodel.CoreAttributeConstants;
import org.archive.crawler.datamodel.CrawlURI;
import org.archive.crawler.framework.CrawlController;
import org.archive.io.ReplayCharSequence;
import org.archive.net.UURI;
import org.archive.util.ArchiveUtils;
import org.archive.util.DevUtils;
import org.archive.util.TextUtils;

/**
 * Processes Javascript files for strings that are likely to be
 * crawlable URIs.
 *
 * @author gojomo
 *
 */
public class ExtractorJS extends Extractor implements CoreAttributeConstants {

    private static final long serialVersionUID = -2231962381454717720L;

    private static Logger LOGGER =
        Logger.getLogger("org.archive.crawler.extractor.ExtractorJS");

    static final String AMP = "&";
    static final String ESCAPED_AMP = "&amp;";
    static final String WHITESPACE = "\\s";

    // finds whitespace-free strings in Javascript
    // (areas between paired ' or " characters, possibly backslash-quoted
    // on the ends, but not in the middle)
    static final String JAVASCRIPT_STRING_EXTRACTOR =
        "(\\\\{0,8}+(?:\"|\'))(\\S{0,"+UURI.MAX_URL_LENGTH+"}?)(?:\\1)";
    // GROUPS:
    // (G1) ' or " with optional leading backslashes
    // (G2) whitespace-free string delimited on boths ends by G1

    // determines whether a string is likely URI
    // (no whitespace or '<' '>',  has an internal dot or some slash,
    // begins and ends with either '/' or a word-char)
    static final String STRING_URI_DETECTOR =
        "(?:\\w|[\\.]{0,2}/)[\\S&&[^<>]]*(?:\\.|/)[\\S&&[^<>]]*(?:\\w|/)";

    protected long numberOfCURIsHandled = 0;
    protected static long numberOfLinksExtracted = 0;

    /**
     * @param name
     */
    public ExtractorJS(String name) {
        super(name, "JavaScript extractor. Link extraction on JavaScript" +
                " files (.js).");
    }

    /* (non-Javadoc)
     * @see org.archive.crawler.framework.Processor#process(org.archive.crawler.datamodel.CrawlURI)
     */
    public void extract(CrawlURI curi) {
        if (!isHttpTransactionContentToProcess(curi)) {
            return;
        }
        String contentType = curi.getContentType();
        if ((contentType == null)) {
            return;
        }
        // If content type is not js and if the viaContext
        // does not begin with 'script', return.
        if((contentType.indexOf("javascript") < 0) &&
            (contentType.indexOf("jscript") < 0) &&
            (contentType.indexOf("ecmascript") < 0) &&
            (!curi.toString().toLowerCase().endsWith(".js")) &&
            (curi.getViaContext() == null || !curi.getViaContext().
                toString().toLowerCase().startsWith("script"))) {
            return;
        }

        this.numberOfCURIsHandled++;

        ReplayCharSequence cs = null;
        try {
            cs = curi.getHttpRecorder().getReplayCharSequence();
        } catch (IOException e) {
            curi.addLocalizedError(this.getName(), e,
            	"Failed get of replay char sequence.");
        }
        if (cs == null) {
            LOGGER.warning("Failed getting ReplayCharSequence: " +
                curi.toString());
            return;
        }

        try {
            try {
                numberOfLinksExtracted += considerStrings(curi, cs,
                        getController(), true);
            } catch (StackOverflowError e) {
                DevUtils.warnHandle(e, "ExtractorJS StackOverflowError");
            }
            // Set flag to indicate that link extraction is completed.
            curi.linkExtractorFinished();
        } finally {
            // Done w/ the ReplayCharSequence. Close it.
            if (cs != null) {
                try {
                    cs.close();
                } catch (IOException ioe) {
                    LOGGER.warning(TextUtils.exceptionToString(
                        "Failed close of ReplayCharSequence.", ioe));
                }
            }
        }
    }

    public static long considerStrings(CrawlURI curi, CharSequence cs,
            CrawlController controller, boolean handlingJSFile) {
        long foundLinks = 0;
        Matcher strings =
            TextUtils.getMatcher(JAVASCRIPT_STRING_EXTRACTOR, cs);
        while(strings.find()) {
            CharSequence subsequence =
                cs.subSequence(strings.start(2), strings.end(2));
            Matcher uri =
                TextUtils.getMatcher(STRING_URI_DETECTOR, subsequence);
            if(uri.matches()) {
                String string = uri.group();
                string = speculativeFixup(string, curi);
                foundLinks++;
                try {
                    if (handlingJSFile) {
                        curi.createAndAddLinkRelativeToVia(string,
                            Link.JS_MISC, Link.SPECULATIVE_HOP);
                    } else {
                        curi.createAndAddLinkRelativeToBase(string,
                            Link.JS_MISC, Link.SPECULATIVE_HOP);
                    }
                } catch (URIException e) {
                    // There may not be a controller (e.g. If we're being run
                    // by the extractor tool).
                    if (controller != null) {
                        controller.logUriError(e, curi.getUURI(), string);
                    } else {
                        LOGGER.info(curi + ", " + string + ": " +
                            e.getMessage());
                    }
                }
            } else {
               foundLinks += considerStrings(curi, subsequence,
                   controller, handlingJSFile);
            }
            TextUtils.recycleMatcher(uri);
        }
        TextUtils.recycleMatcher(strings);
        return foundLinks;
    }

    /**
     * Perform additional fixup of likely-URI Strings
     * 
     * @param string detected candidate String
     * @return String changed/decoded to increase liklihood it is a 
     * meaningful non-404 URI
     */
    public static String speculativeFixup(String string, CrawlURI curi) {
        String retVal = string;
        
        // unescape ampersands
        retVal = TextUtils.replaceAll(ESCAPED_AMP, retVal, AMP);
        
        // uri-decode if begins with encoded 'http(s)?%3A'
        Matcher m = TextUtils.getMatcher("(?i)^https?%3A.*",retVal); 
        if(m.matches()) {
            try {
                retVal = LaxURLCodec.DEFAULT.decode(retVal);
            } catch (DecoderException e) {
                LOGGER.log(Level.INFO,"unable to decode",e);
            }
        }
        TextUtils.recycleMatcher(m);
        
        // TODO: more URI-decoding if there are %-encoded parts?
        
        // detect scheme-less intended-absolute-URI
        // intent: "opens with what looks like a dotted-domain, and 
        // last segment is a top-level-domain (eg "com", "org", etc)" 
        m = TextUtils.getMatcher(
                "^[^\\./:\\s%]+\\.[^/:\\s%]+\\.([^\\./:\\s%]+)(/.*|)$", 
                retVal);
        if(m.matches()) {
            if(ArchiveUtils.isTld(m.group(1))) { 
                String schemePlus = "http://";       
                // if on exact same host preserve scheme (eg https)
                try {
                    if (retVal.startsWith(curi.getUURI().getHost())) {
                        schemePlus = curi.getUURI().getScheme() + "://";
                    }
                } catch (URIException e) {
                    // error retrieving source host - ignore it
                }
                retVal = schemePlus + retVal; 
            }
        }
        TextUtils.recycleMatcher(m);
        
        return retVal; 
    }

    /*
     * (non-Javadoc)
     * 
     * @see org.archive.crawler.framework.Processor#report()
     */
    public String report() {
        StringBuffer ret = new StringBuffer();
        ret.append("Processor: org.archive.crawler.extractor.ExtractorJS\n");
        ret.append("  Function:          Link extraction on JavaScript code\n");
        ret.append("  CrawlURIs handled: " + numberOfCURIsHandled + "\n");
        ret.append("  Links extracted:   " + numberOfLinksExtracted + "\n\n");

        return ret.toString();
    }
}
