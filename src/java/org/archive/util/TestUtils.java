/* TestUtils
*
* $Id: TestUtils.java 4644 2006-09-20 22:40:21Z paul_jack $
*
* Created on Dec 28, 2004
*
* Copyright (C) 2004 Internet Archive.
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
package org.archive.util;

import java.lang.ref.SoftReference;
import java.util.LinkedList;

/**
 * Utility methods useful in testing situations.
 * 
 * @author gojomo
 */
public class TestUtils {

    /**
     * Temporarily exhaust memory, forcing weak/soft references to
     * be broken. 
     */
    public static void forceScarceMemory() {
        // force soft references to be broken
        LinkedList<SoftReference> hog = new LinkedList<SoftReference>();
        long blocks = Runtime.getRuntime().maxMemory() / 1000000;
        for(long l = 0; l <= blocks; l++) {
            try {
                hog.add(new SoftReference<byte[]>(new byte[1000000]));
            } catch (OutOfMemoryError e) {
                hog = null;
                break;
            }
        }
    }
}
