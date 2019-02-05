rem Downloads the given dependencies to a local maven 2 repository and copies them to a local maven 1 repository
rem
rem TODO This could be made a little cleaner creating a list of groupId:artifactId:version and looping through for all entries
rem in the list

rem
rem Install dependencies that are in the .\lib folder into both local maven 1 and local maven 2 repositories.
rem If they exist in maven central or some other public repository, load them from that repository.
rem Note that these dependencies, when manually loaded, do not include a pom.
rem They are in alphabetical order by groupId, artifactId.

rem je-3.3.62.jar is available from spring plugins com.sleepycat:je:3.3.62 (April 2018?) (18.3.12 is available November 2018)
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://repo.spring.io/plugins-release/ ^
  -Dartifact=com.sleepycat:je:3.3.62
call md %userprofile%\.maven\repository\com.sleepycat\jars
call copy %userprofile%\.m2\repository\com\sleepycat\je\3.3.62\je-3.3.62.jar %userprofile%\.maven\repository\com.sleepycat\jars

rem itext-1.2.0.jar - this version does not exist on maven central but com.lowagie:itext:1.2.3 does, so we use it (June 2006) (4.2.2 is available July 2015)
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ ^
  -Dartifact=com.lowagie:itext:1.2.3
call md %userprofile%\.maven\repository\com.lowagie\jars
call copy %userprofile%\.m2\repository\com\lowagie\itext\1.2.3\itext-1.2.3.jar %userprofile%\.maven\repository\com.lowagie\jars

rem commons-cli-1.0.jar is available from maven central commons-cli:commons-cli:1.0 (November 2005) (1.4 is available - March 2017)
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ ^
  -Dartifact=commons-cli:commons-cli:1.0
call md %userprofile%\.maven\repository\commons-cli\jars
call copy %userprofile%\.m2\repository\commons-cli\commons-cli\1.0\commons-cli-1.0.jar %userprofile%\.maven\repository\commons-cli\jars

rem commons-collections-3.1.jar is available from maven central commons-collections:commons-collections:3.1 (November 2005) (3.2.2 is available - November 2015)
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ ^
  -Dartifact=commons-collections:commons-collections:3.1
call md %userprofile%\.maven\repository\commons-collections\jars
call copy %userprofile%\.m2\repository\commons-collections\commons-collections\3.1\commons-collections-3.1.jar %userprofile%\.maven\repository\commons-collections\jars

rem commons-codec-1.3.jar is available from maven central commons-codec:commons-codec:1.3 (November 2005) (1.11 is available October 2017)
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ ^
  -Dartifact=commons-codec:commons-codec:1.3
call md %userprofile%\.maven\repository\commons-codec\jars
call copy %userprofile%\.m2\repository\commons-codec\commons-codec\1.3\commons-codec-1.3.jar %userprofile%\.maven\repository\commons-codec\jars

rem commons-io-1.3.1.jar is available from maven central commons-io:commons-io:1.3.1 (February 2007) (2.6 is available October 2017)
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ ^
  -Dartifact=commons-io:commons-io:1.3.1
call md %userprofile%\.maven\repository\commons-io\jars
call copy %userprofile%\.m2\repository\commons-io\commons-io\1.3.1\commons-io-1.3.1.jar %userprofile%\.maven\repository\commons-io\jars

rem commons-lang-2.3.jar is available from maven central commons-lang:commons-lang:2.3 (February 2007) (2.6 is available - January 2007)
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ ^
  -Dartifact=commons-lang:commons-lang:2.3
call md %userprofile%\.maven\repository\commons-lang\jars
call copy %userprofile%\.m2\repository\commons-lang\commons-lang\2.3\commons-lang-2.3.jar %userprofile%\.maven\repository\commons-lang\jars

rem commons-logging-1.0.4.jar is available from maven central commons-logging:commons-logging:1.0.4 (November 2005) (1.2 is available July 2014)
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ ^
  -Dartifact=commons-logging:commons-logging:1.0.4
call md %userprofile%\.maven\repository\commons-logging\jars
call copy %userprofile%\.m2\repository\commons-logging\commons-logging\1.0.4\commons-logging-1.0.4.jar %userprofile%\.maven\repository\commons-logging\jars

rem commons-net-1.4.1.jar is available from maven central commons-net:commons-net:1.4.1 (December 2005) (3.6 is available - February 2017)
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ ^
  -Dartifact=commons-net:commons-net:1.4.1
call md %userprofile%\.maven\repository\commons-lang\jars
call copy %userprofile%\.m2\repository\commons-net\commons-net\1.4.1\commons-net-1.4.1.jar %userprofile%\.maven\repository\commons-net\jars

rem dnsjava-2.0.3.jar - this version does not exist on maven central but dnsjava:dnsjava:jar:2.0.6 does, so we use it (October 2009) (2.1.8 is available January 2017)
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ ^
  -Dartifact=dnsjava:dnsjava:2.0.6
call md %userprofile%\.maven\repository\dnsjava\jars
call copy %userprofile%\.m2\repository\dnsjava\dnsjava\2.0.6\dnsjava-2.0.6.jar %userprofile%\.maven\repository\dnsjava\jars

rem fastutil-5.0.3-heritrix-subset-1.0.jar - this is a very specific heritrix version. Maven central only has fastutil:fastutil:5.0.4 (August 2006)
call mvn install:install-file -DgroupId=fastutil -DartifactId=fastutil ^
      -Dversion=5.0.3-heritrix-subset-1.0 ^
      -Dpackaging=jar ^
      -Dfile=.\lib\fastutil-5.0.3-heritrix-subset-1.0.jar
call md %userprofile%\.maven\repository\fastutil\jars
call copy %userprofile%\.m2\repository\fastutil\fastutil\5.0.3-heritrix-subset-1.0\fastutil-5.0.3-heritrix-subset-1.0.jar %userprofile%\.maven\repository\fastutil\jars

rem mg4j-1.0.1.jar - nothing related to this version exists on maven central (it.unimi.dsi:mg4j:jar:4.0.3 February 2012 seems too incompatible)
rem we load it manually
call mvn install:install-file -DgroupId=it.unimi.dsi -DartifactId=mg4j ^
      -Dversion=1.0.1 ^
      -Dpackaging=jar ^
      -Dfile=.\lib\mg4j-1.0.1.jar
call md %userprofile%\.maven\repository\it.unimi.dsi\jars
call copy %userprofile%\.m2\repository\it\unimi\dsi\mg4j\1.0.1\mg4j-1.0.1.jar %userprofile%\.maven\repository\it.unimi.dsi\jars

rem javaswf-CVS-SNAPSHOT-1.jar - this is a very specific javaswf version. There is nothing about javaswf on Maven Central.
rem It seems to be related to this sourceforge flash-related project: http://javaswf.sourceforge.net/
call mvn install:install-file -DgroupId=javaswf -DartifactId=javaswf ^
      -Dversion=CVS-SNAPSHOT ^
      -Dpackaging=jar ^
      -Dfile=.\lib\javaswf-CVS-SNAPSHOT-1.jar
call md %userprofile%\.maven\repository\javaswf\jars
call copy %userprofile%\.m2\repository\javaswf\javaswf\CVS-SNAPSHOT\javaswf-CVS-SNAPSHOT.jar %userprofile%\.maven\repository\javaswf\jars

rem junit-3.8.2.jar is available from maven central junit:junit:3.8.2 (May 2007) (4.12 is available December 2014)
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ ^
  -Dartifact=junit:junit:3.8.2
call md %userprofile%\.maven\repository\junit\jars
call copy %userprofile%\.m2\repository\junit\junit\3.8.2\junit-3.8.2.jar %userprofile%\.maven\repository\junit\jars

rem jericho-html-2.6.jar is available from maven central net.htmlparser.jericho:jericho-html:2.6 (July 2008) (3.4 is available October 2015)
rem but the 2.6 version seems to have an invalid header, so we use 2.6.1 (January 2009)
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ ^
  -Dartifact=net.htmlparser.jericho:jericho-html:2.6.1
call md %userprofile%\.maven\repository\net.htmlparser.jericho\jars
call copy %userprofile%\.m2\repository\net\htmlparser\jericho\jericho-html\2.6.1\jericho-html-2.6.1.jar %userprofile%\.maven\repository\net.htmlparser.jericho\jars

rem ant-1.6.2.jar can probably be replaced with org.apache.ant:ant:1.7.1 (July 2008) (1.10.5 is available - July 2018)
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ ^
  -Dartifact=org.apache.ant:ant:1.7.1
call md %userprofile%\.maven\repository\org.apache.ant\jars
call copy %userprofile%\.m2\repository\org\apache\ant\ant\1.7.1\ant-1.7.1.jar %userprofile%\.maven\repository\org.apache.ant\jars

rem jets3t-0.5.0.jar - this version does not exist on maven central but org.apache.mahout.jets3t:jets3t:0.6.1 does, so we use it (April 2009) (0.7.1 is available November 2009)
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ ^
  -Dartifact=org.apache.mahout.jets3t:jets3t:0.6.1
call md %userprofile%\.maven\repository\org.apache.mahout.jets3t\jars
call copy %userprofile%\.m2\repository\org\apache\mahout\jets3t\jets3t\0.6.1\jets3t-0.6.1.jar %userprofile%\.maven\repository\org.apache.mahout.jets3t\jars

rem bsh-2.0b4.jar is available from maven central org.beanshell:bsh:2.0b4 (May 2006) (2.0b5 is available March 2012)
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ ^
  -Dartifact=org.beanshell:bsh:2.0b4
call md %userprofile%\.maven\repository\org.beanshell\jars
call copy %userprofile%\.m2\repository\org\beanshell\bsh\2.0b4\bsh-2.0b4.jar %userprofile%\.maven\repository\org.beanshell\jars

rem libidn-0.5.9.jar - this version does not exist on maven central but org.gnu.inet:libidn:0.6.5 does, so we use it (July 2006) (1.1.5 is available October 2009)
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ ^
  -Dartifact=org.gnu.inet:libidn:0.6.5
call md %userprofile%\.maven\repository\org.gnu.inet\jars
call copy %userprofile%\.m2\repository\org\gnu\inet\libidn\0.6.5\libidn-0.6.5.jar %userprofile%\.maven\repository\org.gnu.inet\jars

rem jetty-4.2.23.jar - the latest 4.2.x version available from maven central is org.mortbay.jetty:jetty:4.2.12 (November 2007),
rem so it's not clear where this version sits. Heritrix SimpleHttpServer only uses the org.mortbay.http classes
rem and it may only be used for self-test, so we'll use the 4.2.12 version.
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ ^
  -Dartifact=org.mortbay.jetty:jetty:4.2.12
call md %userprofile%\.maven\repository\org.mortbay.jetty\jars
call copy %userprofile%\.m2\repository\org\mortbay\jetty\jetty\4.2.12\jetty-4.2.12.jar %userprofile%\.maven\repository\org.mortbay.jetty\jars

rem poi-2.0-RC1-20031102.jar - this version does not exist on maven central but poi:poi:2.0-final-20040126 does, so we use it (November 2006) (3.1-FINAL is available June 2008)
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ ^
  -Dartifact=poi:poi:2.0-final-20040126
call md %userprofile%\.maven\repository\poi\jars
call copy %userprofile%\.m2\repository\poi\poi\2.0-final-20040126\poi-2.0-final-20040126.jar %userprofile%\.maven\repository\poi\jars

rem poi-scratchpad-2.0-RC1-20031102.jar is identical to maven central poi:poi-scratchpad:jar:2.0-final-20040126 (November 2006) (3.1-FINAL is available June 2008)
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ ^
  -Dartifact=poi:poi-scratchpad:2.0-final-20040126
call md %userprofile%\.maven\repository\poi\jars
call copy %userprofile%\.m2\repository\poi\poi-scratchpad\2.0-final-20040126\poi-scratchpad-2.0-final-20040126.jar %userprofile%\.maven\repository\poi\jars

rem jasper-compiler-tomcat-4.1.30.jar is available from maven central tomcat:jasper-compiler:4.1.30 (November 2005) (5.5.23 is available January 2008)
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ ^
  -Dartifact=tomcat:jasper-compiler:4.1.30
call md %userprofile%\.maven\repository\tomcat\jars
call copy %userprofile%\.m2\repository\tomcat\jasper-compiler\4.1.30\jasper-compiler-4.1.30.jar %userprofile%\.maven\repository\tomcat\jars

rem servlet-tomcat-4.1.30.jar - this version does not exist on maven central but tomcat:servlet:4.1.36 does, so we use it (July 2007)
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ ^
  -Dartifact=tomcat:servlet:4.1.36
call md %userprofile%\.maven\repository\tomcat\jars
call copy %userprofile%\.m2\repository\tomcat\servlet\4.1.36\servlet-4.1.36.jar %userprofile%\.maven\repository\tomcat\jars

rem jasper-runtime-tomcat-4.1.30.jar - this version does not exist on maven central but tomcat:jasper-runtime:4.1.36 does, so we use it (July 2007) (5.5.23 is available January 2008)
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ ^
  -Dartifact=tomcat:jasper-runtime:4.1.36
call md %userprofile%\.maven\repository\tomcat\jars
call copy %userprofile%\.m2\repository\tomcat\jasper-runtime\4.1.36\jasper-runtime-4.1.36.jar %userprofile%\.maven\repository\tomcat\jars


rem
rem  Dependencies required (aside from commons-httpclient and commons-pool, which are at the bottom of this script)

rem Note that these dependencies are in alphabetical order by groupId then artifactId

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=ant:ant-commons-net:1.6.5
call md %userprofile%\.maven\repository\ant\jars
call copy %userprofile%\.m2\repository\ant\ant-commons-net\1.6.5\ant-commons-net-1.6.5.jar %userprofile%\.maven\repository\ant\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=antlr:antlr:2.7.6
call md %userprofile%\.maven\repository\antlr\jars
call copy %userprofile%\.m2\repository\antlr\antlr\2.7.6\antlr-2.7.6.jar %userprofile%\.maven\repository\antlr\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=asm:asm:3.0
call md %userprofile%\.maven\repository\asm\jars
call copy %userprofile%\.m2\repository\asm\asm\3.0\asm-3.0.jar %userprofile%\.maven\repository\asm\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=avalon-framework:avalon-framework:4.1.5
call md %userprofile%\.maven\repository\avalon-framework\jars
call copy %userprofile%\.m2\repository\avalon-framework\avalon-framework\4.1.5\avalon-framework-4.1.5.jar %userprofile%\.maven\repository\avalon-framework\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=backport-util-concurrent:backport-util-concurrent:3.0
call md %userprofile%\.maven\repository\backport-util-concurrent\jars
call copy %userprofile%\.m2\repository\backport-util-concurrent\backport-util-concurrent\3.0\backport-util-concurrent-3.0.jar %userprofile%\.maven\repository\backport-util-concurrent\jars

rem The 1.5-fop-0.20.5 version does not exist in maven central, nor does it exist at http://xmlgraphics.apache.org/batik/
rem Try to download the 1.5 version of batik:batik and then re-upload at 1.5-fop-0.20-5, although this may not work with the maven-tasklist-plugin:report
rem call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=batik:batik:1.5-fop-0.20-5
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=batik:batik:1.5
call mvn install:install-file -DgroupId=batik -DartifactId=batik -Dversion=1.5-fop-0.20-5 -Dpackaging=jar -Dfile=%userprofile%\.m2\repository\batik\batik\1.5\batik-1.5.jar
call md %userprofile%\.maven\repository\batik\jars
call copy %userprofile%\.m2\repository\batik\batik\1.5-fop-0.20-5\batik-1.5-fop-0.20-5.jar %userprofile%\.maven\repository\batik\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=com.jcraft:jsch:0.1.27
call md %userprofile%\.maven\repository\com.jcraft\jars
call copy %userprofile%\.m2\repository\com\jcraft\jsch\0.1.27\jsch-0.1.27.jar %userprofile%\.maven\repository\com.jcraft\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-beanutils:commons-beanutils:1.6.1
call md %userprofile%\.maven\repository\commons-beanutils\jars
call copy %userprofile%\.m2\repository\commons-beanutils\commons-beanutils\1.6.1\commons-beanutils-1.6.1.jar %userprofile%\.maven\repository\commons-beanutils\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-codec:commons-codec:1.2
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-codec:commons-codec:1.3
call md %userprofile%\.maven\repository\commons-codec\jars
call copy %userprofile%\.m2\repository\commons-codec\commons-codec\1.2\commons-codec-1.2.jar %userprofile%\.maven\repository\commons-codec\jars
call copy %userprofile%\.m2\repository\commons-codec\commons-codec\1.3\commons-codec-1.3.jar %userprofile%\.maven\repository\commons-codec\jars
# add commons-codec-1.3 to %userprofile%\.maven\cache\maven-artifact-plugin-1.9.1\lib\
call md  %userprofile%\.maven\cache\maven-artifact-plugin-1.9.1\lib\
call copy %userprofile%\.m2\repository\commons-codec\commons-codec\1.3\commons-codec-1.3.jar %userprofile%\.maven\cache\maven-artifact-plugin-1.9.1\lib\

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-collections:commons-collections:3.0
call md %userprofile%\.maven\repository\commons-collections\jars
call copy %userprofile%\.m2\repository\commons-collections\commons-collections\3.0\commons-collections-3.0.jar %userprofile%\.maven\repository\commons-collections\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-grant:commons-grant:1.0-beta-4
call md %userprofile%\.maven\repository\commons-grant\jars
call copy %userprofile%\.m2\repository\commons-grant\commons-grant\1.0-beta-4\commons-grant-1.0-beta-4.jar %userprofile%\.maven\repository\commons-grant\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-httpclient:commons-httpclient:3.0
call md %userprofile%\.maven\repository\commons-httpclient\jars
call copy %userprofile%\.m2\repository\commons-httpclient\commons-httpclient\3.0\commons-httpclient-3.0.jar %userprofile%\.maven\repository\commons-httpclient\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-jelly:commons-jelly:1.0-RC1
call md %userprofile%\.maven\repository\commons-jelly\jars
call copy %userprofile%\.m2\repository\commons-jelly\commons-jelly\1.0-RC1\commons-jelly-1.0-RC1.jar %userprofile%\.maven\repository\commons-jelly\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-jelly:commons-jelly-tags-ant:1.1
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-jelly:commons-jelly-tags-antlr:1.0
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-jelly:commons-jelly-tags-fmt:1.0
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-jelly:commons-jelly-tags-html:1.0
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-jelly:commons-jelly-tags-interaction:1.1
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-jelly:commons-jelly-tags-jsl:1.0
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-jelly:commons-jelly-tags-log:1.0
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-jelly:commons-jelly-tags-velocity:1.0
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-jelly:commons-jelly-tags-xml:1.1
call md %userprofile%\.maven\repository\commons-jelly\jars
call copy %userprofile%\.m2\repository\commons-jelly\commons-jelly-tags-ant\1.1\commons-jelly-tags-ant-1.1.jar %userprofile%\.maven\repository\commons-jelly\jars
call copy %userprofile%\.m2\repository\commons-jelly\commons-jelly-tags-antlr\1.0\commons-jelly-tags-antlr-1.0.jar %userprofile%\.maven\repository\commons-jelly\jars
call copy %userprofile%\.m2\repository\commons-jelly\commons-jelly-tags-fmt\1.0\commons-jelly-tags-fmt-1.0.jar %userprofile%\.maven\repository\commons-jelly\jars
call copy %userprofile%\.m2\repository\commons-jelly\commons-jelly-tags-html\1.0\commons-jelly-tags-html-1.0.jar %userprofile%\.maven\repository\commons-jelly\jars
call copy %userprofile%\.m2\repository\commons-jelly\commons-jelly-tags-interaction\1.1\commons-jelly-tags-interaction-1.1.jar %userprofile%\.maven\repository\commons-jelly\jars
call copy %userprofile%\.m2\repository\commons-jelly\commons-jelly-tags-jsl\1.0\commons-jelly-tags-jsl-1.0.jar %userprofile%\.maven\repository\commons-jelly\jars
call copy %userprofile%\.m2\repository\commons-jelly\commons-jelly-tags-log\1.0\commons-jelly-tags-log-1.0.jar %userprofile%\.maven\repository\commons-jelly\jars
call copy %userprofile%\.m2\repository\commons-jelly\commons-jelly-tags-velocity\1.0\commons-jelly-tags-velocity-1.0.jar %userprofile%\.maven\repository\commons-jelly\jars
call copy %userprofile%\.m2\repository\commons-jelly\commons-jelly-tags-xml\1.1\commons-jelly-tags-xml-1.1.jar %userprofile%\.maven\repository\commons-jelly\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-jexl:commons-jexl:1.1
call md %userprofile%\.maven\repository\commons-jexl\jars
call copy %userprofile%\.m2\repository\commons-jexl\commons-jexl\1.1\commons-jexl-1.1.jar %userprofile%\.maven\repository\commons-jexl\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-lang:commons-lang:2.0
call md %userprofile%\.maven\repository\commons-lang\jars
call copy %userprofile%\.m2\repository\commons-lang\commons-lang\2.0\commons-lang-2.0.jar %userprofile%\.maven\repository\commons-lang\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-logging:commons-logging:1.0.4
call md %userprofile%\.maven\repository\commons-logging\jars
call copy %userprofile%\.m2\repository\commons-logging\commons-logging\1.0.4\commons-logging-1.0.4.jar %userprofile%\.maven\repository\commons-logging\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=commons-net:commons-net:1.4.1
call md %userprofile%\.maven\repository\commons-net\jars
call copy %userprofile%\.m2\repository\commons-net\commons-net\1.4.1\commons-net-1.4.1.jar %userprofile%\.maven\repository\commons-net\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=dom4j:dom4j:1.4
call md %userprofile%\.maven\repository\dom4j\jars
call copy %userprofile%\.m2\repository\dom4j\dom4j\1.4\dom4j-1.4.jar %userprofile%\.maven\repository\dom4j\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=fop:fop:0.20.5
call md %userprofile%\.maven\repository\fop\jars
call copy %userprofile%\.m2\repository\fop\fop\0.20.5\fop-0.20.5.jar %userprofile%\.maven\repository\fop\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=forehead:forehead:1.0-beta-5
call md %userprofile%\.maven\repository\forehead\jars
call copy %userprofile%\.m2\repository\forehead\forehead\1.0-beta-5\forehead-1.0-beta-5.jar %userprofile%\.maven\repository\forehead\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=javacc:javacc:3.2
call md %userprofile%\.maven\repository\javacc\jars
call copy %userprofile%\.m2\repository\javacc\javacc\3.2\javacc-3.2.jar %userprofile%\.maven\repository\javacc\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=jaxen:jaxen:1.1-beta-9
call md %userprofile%\.maven\repository\jaxen\jars
call copy %userprofile%\.m2\repository\jaxen\jaxen\1.1-beta-9\jaxen-1.1-beta-9.jar %userprofile%\.maven\repository\jaxen\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=jdom:jdom:1.0
call md %userprofile%\.maven\repository\jdom\jars
call copy %userprofile%\.m2\repository\jdom\jdom\1.0\jdom-1.0.jar %userprofile%\.maven\repository\jdom\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=jline:jline:0.9.5
call md %userprofile%\.maven\repository\jline\jars
call copy %userprofile%\.m2\repository\jline\jline\0.9.5\jline-0.9.5.jar %userprofile%\.maven\repository\jline\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=junit:junit:3.8.2
call md %userprofile%\.maven\repository\junit\jars
call copy %userprofile%\.m2\repository\junit\junit\3.8.2\junit-3.8.2.jar %userprofile%\.maven\repository\junit\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=log4j:log4j:1.2.13
call md %userprofile%\.maven\repository\log4j\jars
call copy %userprofile%\.m2\repository\log4j\log4j\1.2.13\log4j-1.2.13.jar %userprofile%\.maven\repository\log4j\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=maven:commons-jelly:1.0.1-20060717
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=maven:dom4j:1.7-20060614
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=maven:maven-model:3.0.2
call md %userprofile%\.maven\repository\maven\jars
call copy %userprofile%\.m2\repository\maven\commons-jelly\1.0.1-20060717\commons-jelly-1.0.1-20060717.jar %userprofile%\.maven\repository\maven\jars
call copy %userprofile%\.m2\repository\maven\dom4j\1.7-20060614\dom4j-1.7-20060614.jar %userprofile%\.maven\repository\maven\jars
call copy %userprofile%\.m2\repository\maven\maven-model\3.0.2\maven-model-3.0.2.jar %userprofile%\.maven\repository\maven\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=msv:msv:20050913
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=msv:isorelax:20050913
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=msv:relaxngDatatype:20050913
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=msv:xsdlib:20050913
call md %userprofile%\.maven\repository\msv\jars
call copy %userprofile%\.m2\repository\msv\msv\20050913\msv-20050913.jar %userprofile%\.maven\repository\msv\jars
call copy %userprofile%\.m2\repository\msv\isorelax\20050913\isorelax-20050913.jar %userprofile%\.maven\repository\msv\jars
call copy %userprofile%\.m2\repository\msv\relaxngDatatype\20050913\relaxngDatatype-20050913.jar %userprofile%\.maven\repository\msv\jars
call copy %userprofile%\.m2\repository\msv\xsdlib\20050913\xsdlib-20050913.jar %userprofile%\.maven\repository\msv\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=nekohtml:nekohtml:0.7.7
call md %userprofile%\.maven\repository\nekohtml\jars
call copy %userprofile%\.m2\repository\nekohtml\nekohtml\0.7.7\nekohtml-0.7.7.jar %userprofile%\.maven\repository\nekohtml\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=net.java.dev.stax-utils:stax-utils:20060502
call md %userprofile%\.maven\repository\net.java.dev.stax-utils\jars
call copy %userprofile%\.m2\repository\net\java\dev\stax-utils\stax-utils\20060502\stax-utils-20060502.jar %userprofile%\.maven\repository\net.java.dev.stax-utils\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven:maven-jxr:1.0
call md %userprofile%\.maven\repository\org.apache.maven\jars
call copy %userprofile%\.m2\repository\org\apache\maven\maven-jxr\1.0\maven-jxr-1.0.jar %userprofile%\.maven\repository\org.apache.maven\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.scm:maven-scm-api:1.0-beta-2
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.scm:maven-scm-provider-clearcase:1.0-beta-2
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.scm:maven-scm-provider-cvs:1.0-beta-2
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.scm:maven-scm-provider-perforce:1.0-beta-2
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.scm:maven-scm-provider-starteam:1.0-beta-2
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.scm:maven-scm-provider-svn:1.0-beta-2
call md %userprofile%\.maven\repository\org.apache.maven.scm\jars
call copy %userprofile%\.m2\repository\org\apache\maven\scm\maven-scm-api\1.0-beta-2\maven-scm-api-1.0-beta-2.jar %userprofile%\.maven\repository\org.apache.maven.scm\jars
call copy %userprofile%\.m2\repository\org\apache\maven\scm\maven-scm-provider-clearcase\1.0-beta-2\maven-scm-provider-clearcase-1.0-beta-2.jar %userprofile%\.maven\repository\org.apache.maven.scm\jars
call copy %userprofile%\.m2\repository\org\apache\maven\scm\maven-scm-provider-cvs\1.0-beta-2\maven-scm-provider-cvs-1.0-beta-2.jar %userprofile%\.maven\repository\org.apache.maven.scm\jars
call copy %userprofile%\.m2\repository\org\apache\maven\scm\maven-scm-provider-perforce\1.0-beta-2\maven-scm-provider-perforce-1.0-beta-2.jar %userprofile%\.maven\repository\org.apache.maven.scm\jars
call copy %userprofile%\.m2\repository\org\apache\maven\scm\maven-scm-provider-starteam\1.0-beta-2\maven-scm-provider-starteam-1.0-beta-2.jar %userprofile%\.maven\repository\org.apache.maven.scm\jars
call copy %userprofile%\.m2\repository\org\apache\maven\scm\maven-scm-provider-svn\1.0-beta-2\maven-scm-provider-svn-1.0-beta-2.jar %userprofile%\.maven\repository\org.apache.maven.scm\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.wagon:wagon-file:1.0-beta-2
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.wagon:wagon-ftp:1.0-beta-2
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.wagon:wagon-http:1.0-beta-2
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.wagon:wagon-provider-api:1.0-beta-2
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.wagon:wagon-ssh:1.0-beta-2
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.wagon:wagon-ssh-common:1.0-beta-2
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.maven.wagon:wagon-ssh-external:1.0-beta-2
call md %userprofile%\.maven\repository\org.apache.maven.wagon\jars
call copy %userprofile%\.m2\repository\org\apache\maven\wagon\wagon-file\1.0-beta-2\wagon-file-1.0-beta-2.jar %userprofile%\.maven\repository\org.apache.maven.wagon\jars
call copy %userprofile%\.m2\repository\org\apache\maven\wagon\wagon-ftp\1.0-beta-2\wagon-ftp-1.0-beta-2.jar %userprofile%\.maven\repository\org.apache.maven.wagon\jars
call copy %userprofile%\.m2\repository\org\apache\maven\wagon\wagon-http\1.0-beta-2\wagon-http-1.0-beta-2.jar %userprofile%\.maven\repository\org.apache.maven.wagon\jars
call copy %userprofile%\.m2\repository\org\apache\maven\wagon\wagon-provider-api\1.0-beta-2\wagon-provider-api-1.0-beta-2.jar %userprofile%\.maven\repository\org.apache.maven.wagon\jars
call copy %userprofile%\.m2\repository\org\apache\maven\wagon\wagon-ssh\1.0-beta-2\wagon-ssh-1.0-beta-2.jar %userprofile%\.maven\repository\org.apache.maven.wagon\jars
call copy %userprofile%\.m2\repository\org\apache\maven\wagon\wagon-ssh-common\1.0-beta-2\wagon-ssh-common-1.0-beta-2.jar %userprofile%\.maven\repository\org.apache.maven.wagon\jars
call copy %userprofile%\.m2\repository\org\apache\maven\wagon\wagon-ssh-external\1.0-beta-2\wagon-ssh-external-1.0-beta-2.jar %userprofile%\.maven\repository\org.apache.maven.wagon\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.apache.velocity:velocity:1.5
call md %userprofile%\.maven\repository\org.apache.velocity\jars
call copy %userprofile%\.m2\repository\org\apache\velocity\velocity\1.5\velocity-1.5.jar %userprofile%\.maven\repository\org.apache.velocity\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=oro:oro:2.0.8
call md %userprofile%\.maven/repository\oro\jars
call copy %userprofile%\.m2\repository\oro\oro\2.0.8\oro-2.0.8.jar  %userprofile%\.maven\repository\oro\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=org.codehaus.plexus:plexus-utils:1.0.5
call md %userprofile%\.maven\repository\org.codehaus.plexus\jars
call copy %userprofile%\.m2\repository\org\codehaus\plexus\plexus-utils\1.0.5\plexus-utils-1.0.5.jar %userprofile%\.maven\repository\org.codehaus.plexus\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=pmd:pmd:2.0.8
call md %userprofile%\.maven/repository\pmd\jars
call copy %userprofile%\.m2\repository\pmd\pmd\3.9\pmd-3.9.jar  %userprofile%\.maven\repository\pmd\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=plexus:plexus-utils:1.0.3
call md %userprofile%\.maven\repository\plexus\jars
call copy %userprofile%\.m2\repository\plexus\plexus-utils\1.0.3\plexus-utils-1.0.3.jar %userprofile%\.maven\repository\plexus\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=stax:stax:1.2.0
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=stax:stax-api:1.0.1
call md %userprofile%\.maven\repository\stax\jars
call copy %userprofile%\.m2\repository\stax\stax\1.2.0\stax-1.2.0.jar %userprofile%\.maven\repository\stax\jars
call copy %userprofile%\.m2\repository\stax\stax-api\1.0.1\stax-api-1.0.1.jar %userprofile%\.maven\repository\stax\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=vdoclet:qdox:current
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=vdoclet:vdoclet:20020711
call md %userprofile%\.maven\repository\vdoclet\jars
call copy %userprofile%\.m2\repository\vdoclet\qdox\current\qdox-current.jar %userprofile%\.maven\repository\vdoclet\jars
call copy %userprofile%\.m2\repository\vdoclet\vdoclet\20020711\vdoclet-20020711.jar %userprofile%\.maven\repository\vdoclet\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=velocity:velocity:1.4
call md %userprofile%\.maven\repository\velocity\jars
call copy %userprofile%\.m2\repository\velocity\velocity\1.4\velocity-1.4.jar %userprofile%\.maven\repository\velocity\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=velocity-dvsl:velocity-dvsl:0.45
call md %userprofile%\.maven\repository\velocity-dvsl\jars
call copy %userprofile%\.m2\repository\velocity-dvsl\velocity-dvsl\0.45\velocity-dvsl-0.45.jar %userprofile%\.maven\repository\velocity-dvsl\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=xalan:xalan:2.7.0
call md %userprofile%\.maven/repository\xalan\jars
call copy %userprofile%\.m2\repository\xalan\xalan\2.7.0\xalan-2.7.0.jar  %userprofile%\.maven\repository\xalan\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=xerces:xercesImpl:2.6.2
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=xerces:xercesImpl:2.8.0
call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=xerces:xmlParserAPIs:2.6.2
call md %userprofile%\.maven\repository\xerces\jars
call copy %userprofile%\.m2\repository\xerces\xercesImpl\2.6.2\xercesImpl-2.6.2.jar %userprofile%\.maven\repository\xerces\jars
call copy %userprofile%\.m2\repository\xerces\xercesImpl\2.8.0\xercesImpl-2.8.0.jar %userprofile%\.maven\repository\xerces\jars
call copy %userprofile%\.m2\repository\xerces\xmlParserAPIs\2.6.2\xmlParserAPIs-2.6.2.jar %userprofile%\.maven\repository\xerces\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=xml-apis:xml-apis:1.3.03
call md %userprofile%\.maven\repository\xml-apis\jars
call copy %userprofile%\.m2\repository\xml-apis\xml-apis\1.3.03\xml-apis-1.3.03.jar %userprofile%\.maven\repository\xml-apis\jars

call mvn org.apache.maven.plugins:maven-dependency-plugin:2.1:get -DrepoUrl=http://central.maven.org/maven2/ -Dartifact=xml-resolver:xml-resolver:1.1
call md %userprofile%\.maven\repository\xml-resolver\jars
call copy %userprofile%\.m2\repository\xml-resolver\xml-resolver\1.1\xml-resolver-1.1.jar %userprofile%\.maven\repository\xml-resolver\jars


rem
rem Download and install special version of commons-httpclient

call md .\target

rem Get the commons-httpclient repository that has the jar checked in
call git clone https://github.com/WebCuratorTool/commons-httpclient-heritrix-1-14.git .\target\commons-httpclient-heritrix-1-14

rem Create the local maven 1.x repository jar location
call md %userprofile%\.maven\repository\commons-httpclient\jars

rem Copy the jar to the local maven 1.x repository
call copy .\target\commons-httpclient-heritrix-1-14\release_archive\commons-httpclient-3.1.1-heritrix-1.14.2-webcuratortool-2.0.1.jar ^
      %userprofile%\.maven\repository\commons-httpclient\jars

rem Copy the jar to the local maven 1.x repository
call copy .\target\commons-httpclient-heritrix-1-14\release_archive\commons-httpclient-3.1.1-heritrix-1.14.2-webcuratortool-2.0.1.pom ^
      %userprofile%\.maven\repository\commons-httpclient\jars

# Install the jar in the local maven 2.x repository
call mvn install:install-file -DgroupId=commons-httpclient -DartifactId=commons-httpclient ^
      -Dversion=3.1.1-heritrix-1.14.2-webcuratortool-2.0.1 ^
      -Dpackaging=jar ^
      -DpomFile=.\target\commons-httpclient-heritrix-1-14\release_archive\commons-httpclient-3.1.1-heritrix-1.14.2-webcuratortool-2.0.1.pom ^
      -Dfile=.\target\commons-httpclient-heritrix-1-14\release_archive\commons-httpclient-3.1.1-heritrix-1.14.2-webcuratortool-2.0.1.jar

rem
rem Download and install special version of commons-pool

call md .\target

rem Get the commons-pool repository that has the jar checked in
call git clone https://github.com/WebCuratorTool/commons-pool-heritrix-1-14.git ./target/commons-pool-heritrix-1-14

rem Create the local maven 1.x repository jar location
call md %userprofile%\.maven\repository\commons-pool\jars

rem Copy the jar to the local maven 1.x repository
call copy .\target\commons-pool-heritrix-1-14\release_archive\commons-pool-1.3.1-heritrix-1.14.2-webcuratortool-2.0.1.jar ^
      %userprofile%\.maven\repository\commons-pool\jars

rem Copy the jar to the local maven 1.x repository
call copy .\target\commons-pool-heritrix-1-14\release_archive\commons-pool-1.3.1-heritrix-1.14.2-webcuratortool-2.0.1.pom ^
      %userprofile%\.maven\repository\commons-pool\jars

rem Install the jar in the local maven 2.x repository
call mvn install:install-file -DgroupId=commons-pool -DartifactId=commons-pool ^
      -Dversion=1.3.1-heritrix-1.14.2-webcuratortool-2.0.1 ^
      -Dpackaging=jar ^
      -DpomFile=.\target\commons-pool-heritrix-1-14\release_archive\commons-pool-1.3.1-heritrix-1.14.2-webcuratortool-2.0.1.pom ^
      -Dfile=.\target\commons-pool-heritrix-1-14\release_archive\commons-pool-1.3.1-heritrix-1.14.2-webcuratortool-2.0.1.jar
