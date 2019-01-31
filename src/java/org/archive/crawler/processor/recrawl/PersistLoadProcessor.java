/* PersistLoadProcessor.java
 * 
 * Created on Feb 13, 2005
 *
 * Copyright (C) 2007 Internet Archive.
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
package org.archive.crawler.processor.recrawl;


import java.util.Iterator;

import org.archive.crawler.datamodel.CrawlURI;

import st.ata.util.AList;

/**
 * Store CrawlURI attributes from latest fetch to persistent storage for
 * consultation by a later recrawl. 
 * 
 * @author gojomo
 * @version $Date: 2006-09-25 20:19:54 +0000 (Mon, 25 Sep 2006) $, $Revision: 4654 $
 */
public class PersistLoadProcessor extends PersistOnlineProcessor {
    private static final long serialVersionUID = -1917169316015093131L;

    /**
     * Usual constructor
     * 
     * @param name
     */
    public PersistLoadProcessor(String name) {
        super(name, "PersistLoadProcessor. Loads CrawlURI attributes " +
                "from a previous crawl for current consultation.");
    }

    @Override
    protected void innerProcess(CrawlURI curi) throws InterruptedException {
        if(shouldLoad(curi)) {
            AList prior = (AList) store.get(persistKeyFor(curi));
            if(prior!=null) {
                // merge in keys
                Iterator iter = prior.getKeys();
                curi.getAList().copyKeysFrom(iter,prior);
            }
        }
    }
}