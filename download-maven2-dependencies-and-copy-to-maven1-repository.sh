#!/bin/sh
# Downloads the given dependencies to a local maven 2 repository and copies them to a local maven 1 repository
#
# TODO This could be made a little cleaner creating a list of groupId:artifactId:version and looping through for all entries
# in the list

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
