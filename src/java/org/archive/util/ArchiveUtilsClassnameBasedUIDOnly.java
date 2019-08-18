/*
 * ArchiveUtils
 *
 * $Header: /cvsroot/archive-crawler/ArchiveOpenCrawler/src/java/org/archive/util/ArchiveUtils.java,v 1.38 2007/01/23 00:29:48 gojomo Exp $
 *
 * Created on Jul 7, 2003
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
 *
 */
package org.archive.util;

/**
 * This only exists to eliminate a conflict with a later version of ArchiveUtils that gets pulled in as a dependency
 * (specifically webarchive-commons-1.1.9.jar).
 *
 * @author gojomo & others
 */
public class ArchiveUtilsClassnameBasedUIDOnly {
    /**
     * Generate a long UID based on the given class and version number.
     * Using this instead of the default will assume serialization
     * compatibility across class changes unless version number is
     * intentionally bumped.
     *
     * @param class1
     * @param version
     * @return UID based off class and version number.
     */
    public static long classnameBasedUID(Class class1, int version) {
        String callingClassname = class1.getName();
        return (long)callingClassname.hashCode() << 32 + version;
    }
}

