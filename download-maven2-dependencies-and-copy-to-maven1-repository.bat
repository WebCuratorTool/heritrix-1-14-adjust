rem Downloads the given dependencies to a local maven 2 repository and copies them to a local maven 1 repository
rem
rem TODO This could be made a little cleaner creating a list of groupId:artifactId:version and looping through for all entries
rem in the list

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
