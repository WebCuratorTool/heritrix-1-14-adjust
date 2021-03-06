#!/bin/sh
# Downloads the given dependencies to the default local maven 2 repository and copies them to a local maven 1 repository
#
# TODO This could be made a little cleaner creating a list of groupId:artifactId:version and looping through for all entries
# in the list

##
## Install dependencies that are in the ./lib folder into both local maven 1 and local maven 2 repositories.
## If they exist in maven central or some other public repository, load them from that repository.
## Note that these dependencies, when manually loaded, do not include a pom.
## They are in alphabetical order by groupId, artifactId.

# je-3.3.62.jar is available from spring plugins com.sleepycat:je:3.3.62 (April 2018?) (18.3.12 is available November 2018)
# je-3.3.62.jar is no longer available from spring plugins (Feb 2020), we now load it manually.
mvn install:install-file -DgroupId=com.sleepycat -DartifactId=je \
      -Dversion=3.3.62 \
      -Dpackaging=jar \
      -Dfile=./lib/je-3.3.62.jar
mkdir -pv ~/.maven/repository/com.sleepycat/jars
cp -v ~/.m2/repository/com/sleepycat/je/3.3.62/je-3.3.62.jar ~/.maven/repository/com.sleepycat/jars

# itext-1.2.0.jar - this version does not exist on maven central but com.lowagie:itext:1.2.3 does, so we use it (June 2006) (4.2.2 is available July 2015)
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ \
  -Dartifact=com.lowagie:itext:1.2.3
mkdir -pv ~/.maven/repository/com.lowagie/jars
cp -v ~/.m2/repository/com/lowagie/itext/1.2.3/itext-1.2.3.jar ~/.maven/repository/com.lowagie/jars

# commons-cli-1.0.jar is available from maven central commons-cli:commons-cli:1.0 (November 2005) (1.4 is available - March 2017)
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ \
  -Dartifact=commons-cli:commons-cli:1.0
mkdir -pv ~/.maven/repository/commons-cli/jars
cp -v ~/.m2/repository/commons-cli/commons-cli/1.0/commons-cli-1.0.jar ~/.maven/repository/commons-cli/jars

# commons-collections-3.1.jar is available from maven central commons-collections:commons-collections:3.1 (November 2005) (3.2.2 is available - November 2015)
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ \
  -Dartifact=commons-collections:commons-collections:3.1
mkdir -pv ~/.maven/repository/commons-collections/jars
cp -v ~/.m2/repository/commons-collections/commons-collections/3.1/commons-collections-3.1.jar ~/.maven/repository/commons-collections/jars

# commons-codec-1.3.jar is available from maven central commons-codec:commons-codec:1.3 (November 2005) (1.11 is available October 2017)
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ \
  -Dartifact=commons-codec:commons-codec:1.3
mkdir -pv ~/.maven/repository/commons-codec/jars
cp -v ~/.m2/repository/commons-codec/commons-codec/1.3/commons-codec-1.3.jar ~/.maven/repository/commons-codec/jars

# commons-io-1.3.1.jar is available from maven central commons-io:commons-io:1.3.1 (February 2007) (2.6 is available October 2017)
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ \
  -Dartifact=commons-io:commons-io:1.3.1
mkdir -pv ~/.maven/repository/commons-io/jars
cp -v ~/.m2/repository/commons-io/commons-io/1.3.1/commons-io-1.3.1.jar ~/.maven/repository/commons-io/jars

# commons-lang-2.3.jar is available from maven central commons-lang:commons-lang:2.3 (February 2007) (2.6 is available - January 2007)
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ \
  -Dartifact=commons-lang:commons-lang:2.3
mkdir -pv ~/.maven/repository/commons-lang/jars
cp -v ~/.m2/repository/commons-lang/commons-lang/2.3/commons-lang-2.3.jar ~/.maven/repository/commons-lang/jars

# commons-logging-1.0.4.jar is available from maven central commons-logging:commons-logging:1.0.4 (November 2005) (1.2 is available July 2014)
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ \
  -Dartifact=commons-logging:commons-logging:1.0.4
mkdir -pv ~/.maven/repository/commons-logging/jars
cp -v ~/.m2/repository/commons-logging/commons-logging/1.0.4/commons-logging-1.0.4.jar ~/.maven/repository/commons-logging/jars

# commons-net-1.4.1.jar is available from maven central commons-net:commons-net:1.4.1 (December 2005) (3.6 is available - February 2017)
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ \
  -Dartifact=commons-net:commons-net:1.4.1
mkdir -pv ~/.maven/repository/commons-net/jars
cp -v ~/.m2/repository/commons-net/commons-net/1.4.1/commons-net-1.4.1.jar ~/.maven/repository/commons-net/jars

# dnsjava-2.0.3.jar - this version does not exist on maven central but dnsjava:dnsjava:jar:2.0.6 does, so we use it (October 2009) (2.1.8 is available January 2017)
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ \
  -Dartifact=dnsjava:dnsjava:2.0.6
mkdir -pv ~/.maven/repository/dnsjava/jars
cp -v ~/.m2/repository/dnsjava/dnsjava/2.0.6/dnsjava-2.0.6.jar ~/.maven/repository/dnsjava/jars

# fastutil-5.0.3-heritrix-subset-1.0.jar - this is a very specific heritrix version. Maven central only has fastutil:fastutil:5.0.4 (August 2006)
# What it looks like is that they've only included a small set of classes, specific ones that they use, maybe because the fastutil jar
# is so big (5.0.9 is almost 13 MB). But there may not be any specific functionality there.
# Web Curator Tool uses fastutil-5.0.9, so we will switch to that.
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ \
  -Dartifact=fastutil:fastutil:5.0.9
mkdir -pv ~/.maven/repository/fastutil/jars
cp -v ~/.m2/repository/fastutil/fastutil/5.0.9/fastutil-5.0.9.jar ~/.maven/repository/fastutil/jars

# mg4j-2.0.1.jar - nothing related to this version exists on maven central (it.unimi.dsi:mg4j:jar:4.0.3 February 2012 seems too incompatible)
# we load it manually
mvn install:install-file -DgroupId=it.unimi.dsi -DartifactId=mg4j \
      -Dversion=2.0.1 \
      -Dpackaging=jar \
      -Dfile=./lib/mg4j-2.0.1.jar
mkdir -pv ~/.maven/repository/it.unimi.dsi/jars
cp -v ~/.m2/repository/it/unimi/dsi/mg4j/2.0.1/mg4j-2.0.1.jar ~/.maven/repository/it.unimi.dsi/jars

# javaswf-CVS-SNAPSHOT-1.jar - this is a very specific javaswf version. There is nothing about javaswf on Maven Central.
# It seems to be related to this sourceforge flash-related project: http://javaswf.sourceforge.net/
# We use the groupId com.anotherbigidea and the version CVS-SNAPSHOT-1 to make it consistent with the same jar
# used by Web Curator Tool
mvn install:install-file -DgroupId=com.anotherbigidea -DartifactId=javaswf \
      -Dversion=CVS-SNAPSHOT-1 \
      -Dpackaging=jar \
      -Dfile=./lib/javaswf-CVS-SNAPSHOT-1.jar
mkdir -pv ~/.maven/repository/com.anotherbigidea/jars
cp -v ~/.m2/repository/com/anotherbigidea/javaswf/CVS-SNAPSHOT-1/javaswf-CVS-SNAPSHOT-1.jar ~/.maven/repository/com.anotherbigidea/jars

# junit-3.8.2.jar is available from maven central junit:junit:3.8.2 (May 2007) (4.12 is available December 2014)
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ \
  -Dartifact=junit:junit:3.8.2
mkdir -pv ~/.maven/repository/junit/jars
cp -v ~/.m2/repository/junit/junit/3.8.2/junit-3.8.2.jar ~/.maven/repository/junit/jars

# jericho-html-2.6.jar is available from maven central net.htmlparser.jericho:jericho-html:2.6 (July 2008) (3.4 is available October 2015)
# but the 2.6 version seems to have an invalid header, so we use 2.6.1 (January 2009)
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ \
  -Dartifact=net.htmlparser.jericho:jericho-html:2.6.1
mkdir -pv ~/.maven/repository/net.htmlparser.jericho/jars
cp -v ~/.m2/repository/net/htmlparser/jericho/jericho-html/2.6.1/jericho-html-2.6.1.jar ~/.maven/repository/net.htmlparser.jericho/jars

# ant-1.6.2.jar can probably be replaced with org.apache.ant:ant:1.7.1 (July 2008) (1.10.5 is available - July 2018)
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ \
  -Dartifact=org.apache.ant:ant:1.7.1
mkdir -pv ~/.maven/repository/org.apache.ant/jars
cp -v ~/.m2/repository/org/apache/ant/ant/1.7.1/ant-1.7.1.jar ~/.maven/repository/org.apache.ant/jars

# jets3t-0.5.0.jar - this version does not exist on maven central but org.apache.mahout.jets3t:jets3t:0.6.1 does, so we use it (April 2009) (0.7.1 is available November 2009)
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ \
  -Dartifact=org.apache.mahout.jets3t:jets3t:0.6.1
mkdir -pv ~/.maven/repository/org.apache.mahout.jets3t/jars
cp -v ~/.m2/repository/org/apache/mahout/jets3t/jets3t/0.6.1/jets3t-0.6.1.jar ~/.maven/repository/org.apache.mahout.jets3t/jars

# bsh-2.0b4.jar is available from maven central org.beanshell:bsh:2.0b4 (May 2006) (2.0b5 is available March 2012)
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ \
  -Dartifact=org.beanshell:bsh:2.0b4
mkdir -pv ~/.maven/repository/org.beanshell/jars
cp -v ~/.m2/repository/org/beanshell/bsh/2.0b4/bsh-2.0b4.jar ~/.maven/repository/org.beanshell/jars

# libidn-0.5.9.jar - this version does not exist on maven central but org.gnu.inet:libidn:0.6.5 does, so we use it (July 2006) (1.1.5 is available October 2009)
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ \
  -Dartifact=org.gnu.inet:libidn:0.6.5
mkdir -pv ~/.maven/repository/org.gnu.inet/jars
cp -v ~/.m2/repository/org/gnu/inet/libidn/0.6.5/libidn-0.6.5.jar ~/.maven/repository/org.gnu.inet/jars

# jetty-4.2.23.jar - the latest 4.2.x version available from maven central is org.mortbay.jetty:jetty:4.2.12 (November 2007),
# so it's not clear where this version sits. Heritrix SimpleHttpServer only uses the org.mortbay.http classes
# and it may only be used for self-test, so we'll use the 4.2.12 version.
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ \
  -Dartifact=org.mortbay.jetty:jetty:4.2.12
mkdir -pv ~/.maven/repository/org.mortbay.jetty/jars
cp -v ~/.m2/repository/org/mortbay/jetty/jetty/4.2.12/jetty-4.2.12.jar ~/.maven/repository/org.mortbay.jetty/jars

# poi-2.0-RC1-20031102.jar - this version does not exist on maven central but poi:poi:2.0-final-20040126 does, so we use it (November 2006) (3.1-FINAL is available June 2008)
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ \
  -Dartifact=poi:poi:2.0-final-20040126
mkdir -pv ~/.maven/repository/poi/jars
cp -v ~/.m2/repository/poi/poi/2.0-final-20040126/poi-2.0-final-20040126.jar ~/.maven/repository/poi/jars

# poi-scratchpad-2.0-RC1-20031102.jar is identical to maven central poi:poi-scratchpad:jar:2.0-final-20040126 (November 2006) (3.1-FINAL is available June 2008)
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ \
  -Dartifact=poi:poi-scratchpad:2.0-final-20040126
mkdir -pv ~/.maven/repository/poi/jars
cp -v ~/.m2/repository/poi/poi-scratchpad/2.0-final-20040126/poi-scratchpad-2.0-final-20040126.jar ~/.maven/repository/poi/jars

# jasper-compiler-tomcat-4.1.30.jar is available from maven central tomcat:jasper-compiler:4.1.30 (November 2005) (5.5.23 is available January 2008)
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ \
  -Dartifact=tomcat:jasper-compiler:4.1.30
mkdir -pv ~/.maven/repository/tomcat/jars
cp -v ~/.m2/repository/tomcat/jasper-compiler/4.1.30/jasper-compiler-4.1.30.jar ~/.maven/repository/tomcat/jars

# servlet-tomcat-4.1.30.jar - this version does not exist on maven central but tomcat:servlet:4.1.36 does, so we use it (July 2007)
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ \
  -Dartifact=tomcat:servlet:4.1.36
mkdir -pv ~/.maven/repository/tomcat/jars
cp -v ~/.m2/repository/tomcat/servlet/4.1.36/servlet-4.1.36.jar ~/.maven/repository/tomcat/jars

# jasper-runtime-tomcat-4.1.30.jar - this version does not exist on maven central but tomcat:jasper-runtime:4.1.36 does, so we use it (July 2007) (5.5.23 is available January 2008)
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ \
  -Dartifact=tomcat:jasper-runtime:4.1.36
mkdir -pv ~/.maven/repository/tomcat/jars
cp -v ~/.m2/repository/tomcat/jasper-runtime/4.1.36/jasper-runtime-4.1.36.jar ~/.maven/repository/tomcat/jars


##
## Dependencies required (aside from commons-httpclient and commons-pool, which are at the bottom of this script)

# Note that these dependencies are in alphabetical order by groupId then artifactId

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=ant:ant-commons-net:1.6.5
mkdir -pv ~/.maven/repository/ant/jars
cp -v ~/.m2/repository/ant/ant-commons-net/1.6.5/ant-commons-net-1.6.5.jar ~/.maven/repository/ant/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=antlr:antlr:2.7.6
mkdir -pv ~/.maven/repository/antlr/jars
cp -v ~/.m2/repository/antlr/antlr/2.7.6/antlr-2.7.6.jar ~/.maven/repository/antlr/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=asm:asm:3.0
mkdir -pv ~/.maven/repository/asm/jars
cp -v ~/.m2/repository/asm/asm/3.0/asm-3.0.jar ~/.maven/repository/asm/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=avalon-framework:avalon-framework:4.1.5
mkdir -pv ~/.maven/repository/avalon-framework/jars
cp -v ~/.m2/repository/avalon-framework/avalon-framework/4.1.5/avalon-framework-4.1.5.jar ~/.maven/repository/avalon-framework/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=backport-util-concurrent:backport-util-concurrent:3.0
mkdir -pv ~/.maven/repository/backport-util-concurrent/jars
cp -v ~/.m2/repository/backport-util-concurrent/backport-util-concurrent/3.0/backport-util-concurrent-3.0.jar ~/.maven/repository/backport-util-concurrent/jars

# The 1.5-fop-0.20.5 version does not exist in maven central, nor does it exist at http://xmlgraphics.apache.org/batik/
# Try to download the 1.5 version of batik:batik and then re-upload at 1.5-fop-0.20-5, although this may not work with the maven-tasklist-plugin:report
# mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=batik:batik:1.5-fop-0.20-5
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=batik:batik:1.5
filePath=~/.m2/repository/batik/batik/1.5/batik-1.5.jar
mvn install:install-file -DgroupId=batik -DartifactId=batik -Dversion=1.5-fop-0.20-5 -Dpackaging=jar -Dfile="${filePath}"
mkdir -pv ~/.maven/repository/batik/jars
cp -v ~/.m2/repository/batik/batik/1.5-fop-0.20-5/batik-1.5-fop-0.20-5.jar ~/.maven/repository/batik/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=com.jcraft:jsch:0.1.27
mkdir -pv ~/.maven/repository/com.jcraft/jars
cp -v ~/.m2/repository/com/jcraft/jsch/0.1.27/jsch-0.1.27.jar ~/.maven/repository/com.jcraft/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-beanutils:commons-beanutils:1.6.1
mkdir -pv ~/.maven/repository/commons-beanutils/jars
cp -v ~/.m2/repository/commons-beanutils/commons-beanutils/1.6.1/commons-beanutils-1.6.1.jar ~/.maven/repository/commons-beanutils/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-codec:commons-codec:1.2
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-codec:commons-codec:1.3
mkdir -pv ~/.maven/repository/commons-codec/jars
cp -v ~/.m2/repository/commons-codec/commons-codec/1.2/commons-codec-1.2.jar ~/.maven/repository/commons-codec/jars
cp -v ~/.m2/repository/commons-codec/commons-codec/1.3/commons-codec-1.3.jar ~/.maven/repository/commons-codec/jars
# add commons-codec-1.3 to ~/.maven/cache/maven-artifact-plugin-1.9.1/lib/
mkdir -pv  ~/.maven/cache/maven-artifact-plugin-1.9.1/lib/
cp -v ~/.m2/repository/commons-codec/commons-codec/1.3/commons-codec-1.3.jar ~/.maven/cache/maven-artifact-plugin-1.9.1/lib/

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-collections:commons-collections:3.0
mkdir -pv ~/.maven/repository/commons-collections/jars
cp -v ~/.m2/repository/commons-collections/commons-collections/3.0/commons-collections-3.0.jar ~/.maven/repository/commons-collections/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-grant:commons-grant:1.0-beta-4
mkdir -pv ~/.maven/repository/commons-grant/jars
cp -v ~/.m2/repository/commons-grant/commons-grant/1.0-beta-4/commons-grant-1.0-beta-4.jar ~/.maven/repository/commons-grant/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-httpclient:commons-httpclient:3.0
mkdir -pv ~/.maven/repository/commons-httpclient/jars
cp -v ~/.m2/repository/commons-httpclient/commons-httpclient/3.0/commons-httpclient-3.0.jar ~/.maven/repository/commons-httpclient/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-jelly:commons-jelly:1.0-RC1
mkdir -pv ~/.maven/repository/commons-jelly/jars
cp -v ~/.m2/repository/commons-jelly/commons-jelly/1.0-RC1/commons-jelly-1.0-RC1.jar ~/.maven/repository/commons-jelly/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-jelly:commons-jelly-tags-ant:1.1
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-jelly:commons-jelly-tags-antlr:1.0
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-jelly:commons-jelly-tags-fmt:1.0
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-jelly:commons-jelly-tags-html:1.0
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-jelly:commons-jelly-tags-interaction:1.1
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-jelly:commons-jelly-tags-jsl:1.0
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-jelly:commons-jelly-tags-log:1.0
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-jelly:commons-jelly-tags-velocity:1.0
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-jelly:commons-jelly-tags-xml:1.1
mkdir -pv ~/.maven/repository/commons-jelly/jars
cp -v ~/.m2/repository/commons-jelly/commons-jelly-tags-ant/1.1/commons-jelly-tags-ant-1.1.jar ~/.maven/repository/commons-jelly/jars
cp -v ~/.m2/repository/commons-jelly/commons-jelly-tags-antlr/1.0/commons-jelly-tags-antlr-1.0.jar ~/.maven/repository/commons-jelly/jars
cp -v ~/.m2/repository/commons-jelly/commons-jelly-tags-fmt/1.0/commons-jelly-tags-fmt-1.0.jar ~/.maven/repository/commons-jelly/jars
cp -v ~/.m2/repository/commons-jelly/commons-jelly-tags-html/1.0/commons-jelly-tags-html-1.0.jar ~/.maven/repository/commons-jelly/jars
cp -v ~/.m2/repository/commons-jelly/commons-jelly-tags-interaction/1.1/commons-jelly-tags-interaction-1.1.jar ~/.maven/repository/commons-jelly/jars
cp -v ~/.m2/repository/commons-jelly/commons-jelly-tags-jsl/1.0/commons-jelly-tags-jsl-1.0.jar ~/.maven/repository/commons-jelly/jars
cp -v ~/.m2/repository/commons-jelly/commons-jelly-tags-log/1.0/commons-jelly-tags-log-1.0.jar ~/.maven/repository/commons-jelly/jars
cp -v ~/.m2/repository/commons-jelly/commons-jelly-tags-velocity/1.0/commons-jelly-tags-velocity-1.0.jar ~/.maven/repository/commons-jelly/jars
cp -v ~/.m2/repository/commons-jelly/commons-jelly-tags-xml/1.1/commons-jelly-tags-xml-1.1.jar ~/.maven/repository/commons-jelly/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-jexl:commons-jexl:1.1
mkdir -pv ~/.maven/repository/commons-jexl/jars
cp -v ~/.m2/repository/commons-jexl/commons-jexl/1.1/commons-jexl-1.1.jar ~/.maven/repository/commons-jexl/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-lang:commons-lang:2.0
mkdir -pv ~/.maven/repository/commons-lang/jars
cp -v ~/.m2/repository/commons-lang/commons-lang/2.0/commons-lang-2.0.jar ~/.maven/repository/commons-lang/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-logging:commons-logging:1.0.4
mkdir -pv ~/.maven/repository/commons-logging/jars
cp -v ~/.m2/repository/commons-logging/commons-logging/1.0.4/commons-logging-1.0.4.jar ~/.maven/repository/commons-logging/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-net:commons-net:1.4.1
mkdir -pv ~/.maven/repository/commons-net/jars
cp -v ~/.m2/repository/commons-net/commons-net/1.4.1/commons-net-1.4.1.jar ~/.maven/repository/commons-net/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=dom4j:dom4j:1.4
mkdir -pv ~/.maven/repository/dom4j/jars
cp -v ~/.m2/repository/dom4j/dom4j/1.4/dom4j-1.4.jar ~/.maven/repository/dom4j/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=fop:fop:0.20.5
mkdir -pv ~/.maven/repository/fop/jars
cp -v ~/.m2/repository/fop/fop/0.20.5/fop-0.20.5.jar ~/.maven/repository/fop/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=forehead:forehead:1.0-beta-5
mkdir -pv ~/.maven/repository/forehead/jars
cp -v ~/.m2/repository/forehead/forehead/1.0-beta-5/forehead-1.0-beta-5.jar ~/.maven/repository/forehead/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=javacc:javacc:3.2
mkdir -pv ~/.maven/repository/javacc/jars
cp -v ~/.m2/repository/javacc/javacc/3.2/javacc-3.2.jar ~/.maven/repository/javacc/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=jaxen:jaxen:1.1-beta-9
mkdir -pv ~/.maven/repository/jaxen/jars
cp -v ~/.m2/repository/jaxen/jaxen/1.1-beta-9/jaxen-1.1-beta-9.jar ~/.maven/repository/jaxen/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=jdom:jdom:1.0
mkdir -pv ~/.maven/repository/jdom/jars
cp -v ~/.m2/repository/jdom/jdom/1.0/jdom-1.0.jar ~/.maven/repository/jdom/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=jline:jline:0.9.5
mkdir -pv ~/.maven/repository/jline/jars
cp -v ~/.m2/repository/jline/jline/0.9.5/jline-0.9.5.jar ~/.maven/repository/jline/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=junit:junit:3.8.2
mkdir -pv ~/.maven/repository/junit/jars
cp -v ~/.m2/repository/junit/junit/3.8.2/junit-3.8.2.jar ~/.maven/repository/junit/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=log4j:log4j:1.2.13
mkdir -pv ~/.maven/repository/log4j/jars
cp -v ~/.m2/repository/log4j/log4j/1.2.13/log4j-1.2.13.jar ~/.maven/repository/log4j/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=maven:commons-jelly:1.0.1-20060717
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=maven:dom4j:1.7-20060614
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=maven:maven-model:3.0.2
mkdir -pv ~/.maven/repository/maven/jars
cp -v ~/.m2/repository/maven/commons-jelly/1.0.1-20060717/commons-jelly-1.0.1-20060717.jar ~/.maven/repository/maven/jars
cp -v ~/.m2/repository/maven/dom4j/1.7-20060614/dom4j-1.7-20060614.jar ~/.maven/repository/maven/jars
cp -v ~/.m2/repository/maven/maven-model/3.0.2/maven-model-3.0.2.jar ~/.maven/repository/maven/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=msv:msv:20050913
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=msv:isorelax:20050913
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=msv:relaxngDatatype:20050913
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=msv:xsdlib:20050913
mkdir -pv ~/.maven/repository/msv/jars
cp -v ~/.m2/repository/msv/msv/20050913/msv-20050913.jar ~/.maven/repository/msv/jars
cp -v ~/.m2/repository/msv/isorelax/20050913/isorelax-20050913.jar ~/.maven/repository/msv/jars
cp -v ~/.m2/repository/msv/relaxngDatatype/20050913/relaxngDatatype-20050913.jar ~/.maven/repository/msv/jars
cp -v ~/.m2/repository/msv/xsdlib/20050913/xsdlib-20050913.jar ~/.maven/repository/msv/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=nekohtml:nekohtml:0.7.7
mkdir -pv ~/.maven/repository/nekohtml/jars
cp -v ~/.m2/repository/nekohtml/nekohtml/0.7.7/nekohtml-0.7.7.jar ~/.maven/repository/nekohtml/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=net.java.dev.stax-utils:stax-utils:20060502
mkdir -pv ~/.maven/repository/net.java.dev.stax-utils/jars
cp -v ~/.m2/repository/net/java/dev/stax-utils/stax-utils/20060502/stax-utils-20060502.jar ~/.maven/repository/net.java.dev.stax-utils/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven:maven-jxr:1.0
mkdir -pv ~/.maven/repository/org.apache.maven/jars
cp -v ~/.m2/repository/org/apache/maven/maven-jxr/1.0/maven-jxr-1.0.jar ~/.maven/repository/org.apache.maven/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.scm:maven-scm-api:1.0-beta-2
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.scm:maven-scm-provider-clearcase:1.0-beta-2
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.scm:maven-scm-provider-cvs:1.0-beta-2
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.scm:maven-scm-provider-perforce:1.0-beta-2
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.scm:maven-scm-provider-starteam:1.0-beta-2
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.scm:maven-scm-provider-svn:1.0-beta-2
mkdir -pv ~/.maven/repository/org.apache.maven.scm/jars
cp -v ~/.m2/repository/org/apache/maven/scm/maven-scm-api/1.0-beta-2/maven-scm-api-1.0-beta-2.jar ~/.maven/repository/org.apache.maven.scm/jars
cp -v ~/.m2/repository/org/apache/maven/scm/maven-scm-provider-clearcase/1.0-beta-2/maven-scm-provider-clearcase-1.0-beta-2.jar ~/.maven/repository/org.apache.maven.scm/jars
cp -v ~/.m2/repository/org/apache/maven/scm/maven-scm-provider-cvs/1.0-beta-2/maven-scm-provider-cvs-1.0-beta-2.jar ~/.maven/repository/org.apache.maven.scm/jars
cp -v ~/.m2/repository/org/apache/maven/scm/maven-scm-provider-perforce/1.0-beta-2/maven-scm-provider-perforce-1.0-beta-2.jar ~/.maven/repository/org.apache.maven.scm/jars
cp -v ~/.m2/repository/org/apache/maven/scm/maven-scm-provider-starteam/1.0-beta-2/maven-scm-provider-starteam-1.0-beta-2.jar ~/.maven/repository/org.apache.maven.scm/jars
cp -v ~/.m2/repository/org/apache/maven/scm/maven-scm-provider-svn/1.0-beta-2/maven-scm-provider-svn-1.0-beta-2.jar ~/.maven/repository/org.apache.maven.scm/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.wagon:wagon-file:1.0-beta-2
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.wagon:wagon-ftp:1.0-beta-2
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.wagon:wagon-http:1.0-beta-2
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.wagon:wagon-provider-api:1.0-beta-2
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.wagon:wagon-ssh:1.0-beta-2
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.wagon:wagon-ssh-common:1.0-beta-2
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.wagon:wagon-ssh-external:1.0-beta-2
mkdir -pv ~/.maven/repository/org.apache.maven.wagon/jars
cp -v ~/.m2/repository/org/apache/maven/wagon/wagon-file/1.0-beta-2/wagon-file-1.0-beta-2.jar ~/.maven/repository/org.apache.maven.wagon/jars
cp -v ~/.m2/repository/org/apache/maven/wagon/wagon-ftp/1.0-beta-2/wagon-ftp-1.0-beta-2.jar ~/.maven/repository/org.apache.maven.wagon/jars
cp -v ~/.m2/repository/org/apache/maven/wagon/wagon-http/1.0-beta-2/wagon-http-1.0-beta-2.jar ~/.maven/repository/org.apache.maven.wagon/jars
cp -v ~/.m2/repository/org/apache/maven/wagon/wagon-provider-api/1.0-beta-2/wagon-provider-api-1.0-beta-2.jar ~/.maven/repository/org.apache.maven.wagon/jars
cp -v ~/.m2/repository/org/apache/maven/wagon/wagon-ssh/1.0-beta-2/wagon-ssh-1.0-beta-2.jar ~/.maven/repository/org.apache.maven.wagon/jars
cp -v ~/.m2/repository/org/apache/maven/wagon/wagon-ssh-common/1.0-beta-2/wagon-ssh-common-1.0-beta-2.jar ~/.maven/repository/org.apache.maven.wagon/jars
cp -v ~/.m2/repository/org/apache/maven/wagon/wagon-ssh-external/1.0-beta-2/wagon-ssh-external-1.0-beta-2.jar ~/.maven/repository/org.apache.maven.wagon/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.velocity:velocity:1.5
mkdir -pv ~/.maven/repository/org.apache.velocity/jars
cp -v ~/.m2/repository/org/apache/velocity/velocity/1.5/velocity-1.5.jar ~/.maven/repository/org.apache.velocity/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=oro:oro:2.0.8
mkdir -pv ~/.maven/repository/oro/jars
cp -v ~/.m2/repository/oro/oro/2.0.8/oro-2.0.8.jar ~/.maven/repository/oro/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.codehaus.plexus:plexus-utils:1.0.5
mkdir -pv ~/.maven/repository/org.codehaus.plexus/jars
cp -v ~/.m2/repository/org/codehaus/plexus/plexus-utils/1.0.5/plexus-utils-1.0.5.jar ~/.maven/repository/org.codehaus.plexus/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=plexus:plexus-utils:1.0.3
mkdir -pv ~/.maven/repository/plexus/jars
cp -v ~/.m2/repository/plexus/plexus-utils/1.0.3/plexus-utils-1.0.3.jar ~/.maven/repository/plexus/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=pmd:pmd:3.9
mkdir -pv ~/.maven/repository/pmd/jars
cp -v ~/.m2/repository/pmd/pmd/3.9/pmd-3.9.jar ~/.maven/repository/pmd/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=stax:stax:1.2.0
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=stax:stax-api:1.0.1
mkdir -pv ~/.maven/repository/stax/jars
cp -v ~/.m2/repository/stax/stax/1.2.0/stax-1.2.0.jar ~/.maven/repository/stax/jars
cp -v ~/.m2/repository/stax/stax-api/1.0.1/stax-api-1.0.1.jar ~/.maven/repository/stax/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=vdoclet:qdox:current
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=vdoclet:vdoclet:20020711
mkdir -pv ~/.maven/repository/vdoclet/jars
cp -v ~/.m2/repository/vdoclet/qdox/current/qdox-current.jar ~/.maven/repository/vdoclet/jars
cp -v ~/.m2/repository/vdoclet/vdoclet/20020711/vdoclet-20020711.jar ~/.maven/repository/vdoclet/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=velocity:velocity:1.4
mkdir -pv ~/.maven/repository/velocity/jars
cp -v ~/.m2/repository/velocity/velocity/1.4/velocity-1.4.jar ~/.maven/repository/velocity/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=velocity-dvsl:velocity-dvsl:0.45
mkdir -pv ~/.maven/repository/velocity-dvsl/jars
cp -v ~/.m2/repository/velocity-dvsl/velocity-dvsl/0.45/velocity-dvsl-0.45.jar ~/.maven/repository/velocity-dvsl/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=xalan:xalan:2.7.0
mkdir -pv ~/.maven/repository/xalan/jars
cp -v ~/.m2/repository/xalan/xalan/2.7.0/xalan-2.7.0.jar ~/.maven/repository/xalan/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=xerces:xercesImpl:2.6.2
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=xerces:xercesImpl:2.8.0
mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=xerces:xmlParserAPIs:2.6.2
mkdir -pv ~/.maven/repository/xerces/jars
cp -v ~/.m2/repository/xerces/xercesImpl/2.6.2/xercesImpl-2.6.2.jar ~/.maven/repository/xerces/jars
cp -v ~/.m2/repository/xerces/xercesImpl/2.8.0/xercesImpl-2.8.0.jar ~/.maven/repository/xerces/jars
cp -v ~/.m2/repository/xerces/xmlParserAPIs/2.6.2/xmlParserAPIs-2.6.2.jar ~/.maven/repository/xerces/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=xml-apis:xml-apis:1.3.03
mkdir -pv ~/.maven/repository/xml-apis/jars
cp -v ~/.m2/repository/xml-apis/xml-apis/1.3.03/xml-apis-1.3.03.jar ~/.maven/repository/xml-apis/jars

mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=xml-resolver:xml-resolver:1.1
mkdir -pv ~/.maven/repository/xml-resolver/jars
cp -v ~/.m2/repository/xml-resolver/xml-resolver/1.1/xml-resolver-1.1.jar ~/.maven/repository/xml-resolver/jars


##
## Download and install special version of commons-httpclient

mkdir -pv ./target

# Get the commons-httpclient repository that has the jar checked in
git clone https://github.com/WebCuratorTool/commons-httpclient-heritrix-1-14.git ./target/commons-httpclient-heritrix-1-14

# Create the local maven 1.x repository jar location
mkdir -pv ~/.maven/repository/commons-httpclient/jars

# Copy the jar to the local maven 1.x repository
cp -v ./target/commons-httpclient-heritrix-1-14/release_archive/commons-httpclient-3.1.1-heritrix-1.14.2-webcuratortool-2.0.1.jar \
      ~/.maven/repository/commons-httpclient/jars
# Copy the pom to the local maven 1.x repository
cp -v ./target/commons-httpclient-heritrix-1-14/release_archive/commons-httpclient-3.1.1-heritrix-1.14.2-webcuratortool-2.0.1.pom \
      ~/.maven/repository/commons-httpclient/jars

# Install the jar in the local maven 2.x repository
mvn install:install-file -DgroupId=commons-httpclient -DartifactId=commons-httpclient \
      -Dversion=3.1.1-heritrix-1.14.2-webcuratortool-2.0.1 \
      -Dpackaging=jar \
      -DpomFile=./target/commons-httpclient-heritrix-1-14/release_archive/commons-httpclient-3.1.1-heritrix-1.14.2-webcuratortool-2.0.1.pom \
      -Dfile=./target/commons-httpclient-heritrix-1-14/release_archive/commons-httpclient-3.1.1-heritrix-1.14.2-webcuratortool-2.0.1.jar

##
## Download and install special version of commons-pool

mkdir -pv ./target

# Get the commons-pool repository that has the jar checked in
git clone https://github.com/WebCuratorTool/commons-pool-heritrix-1-14.git ./target/commons-pool-heritrix-1-14

# Create the local maven 1.x repository jar location
mkdir -pv ~/.maven/repository/commons-pool/jars

# Copy the jar to the local maven 1.x repository
cp -v ./target/commons-pool-heritrix-1-14/release_archive/commons-pool-1.3.1-heritrix-1.14.2-webcuratortool-2.0.1.jar \
      ~/.maven/repository/commons-pool/jars

# Copy the pom to the local maven 1.x repository
cp -v ./target/commons-pool-heritrix-1-14/release_archive/commons-pool-1.3.1-heritrix-1.14.2-webcuratortool-2.0.1.pom \
      ~/.maven/repository/commons-pool/jars

# Install the jar in the local maven 2.x repository
mvn install:install-file -DgroupId=commons-pool -DartifactId=commons-pool \
      -Dversion=1.3.1-heritrix-1.14.2-webcuratortool-2.0.1 \
      -Dpackaging=jar \
      -DpomFile=./target/commons-pool-heritrix-1-14/release_archive/commons-pool-1.3.1-heritrix-1.14.2-webcuratortool-2.0.1.pom \
      -Dfile=./target/commons-pool-heritrix-1-14/release_archive/commons-pool-1.3.1-heritrix-1.14.2-webcuratortool-2.0.1.jar

