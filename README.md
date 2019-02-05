# heritrix-1-14-adjust
An adjusted version of heritrix-1.14.1 to work with updated dependencies.

## Synopsis

The heritrix-1.14.1.jar includes Apache commons-httpclient and commons-pool code in its jar instead of relying on an
external dependency. Unfortunately, this version packaged with the code conflicts with commons-httpclient and
commons-pool versions used with the Web Curator Tool (https://github.com/DIA-NZ/webcurator).

This version attempts to correct the conflicts with commons-httpclient version 3.1 and commons-pool version 1.3. It does
this by moving the changed `commons-httpclient` and `commons-pool` code to special versions of those libraries. These
changed versions can be found at https://github.com/WebCuratorTool/commons-httpclient-heritrix-1-14 and
https://github.com/WebCuratorTool/commons-pool-heritrix-1-14 respectively. See their respective `README.md`s for more
details.

## Motivation

Provide a non-conflicting set of dependencies so the heritrix 1.14.1 crawler can work without classpath conflicts.

## Code changes

Several code changes have been done to remove the `commons-httpclient` and `commons-pool` code from the generated jar.

1. The `heritrix-1.14.1` code that appeared in `org/apache/commons/httpclient` and `org/apache/commons/pool` has been
moved to the `commons-httpclient-heritrix-1-14` and `commons-pool-heritrix-1-14` github projects respectively. This code no
longer appears in this codebase.

2. The classes `LaxURI`, `LaxURLCodec` and `HttpRecorderMarker` have been moved to the `commons-httpclient-heritrix-1-14`
codebase. This is because these classes are used in the commons-httpclient modified code and maven builds do not allow
cyclic dependencies. Their package is now `org.apache.commons.httpclient.heritrix`.

3. The `commons-httpclient-heritrix-1-14` codebase has added an interface
`org.apache.commons.httpclient.heritrix.HttpRecorder` that allows classes in `commons-httpclient` to reference
`HttpRecorder` without having a dependency on the heritrix `HttpRecorder` class. The heritrix `HttpRecorder` class
implements the `commons-httpclient` `org.apache.commons.httpclient.heritrix.HttpRecorder` interface.

4. The static method `HttpRecorder#getHttpRecorder` has been replaced with
`org.apache.commons.httpclient.heritrix.HttpRecorderRetriever#getHttpRecorder`. This method returns the
interface `org.apache.commons.httpclient.heritrix.HttpRecorder`. To use non-interface methods, the returned object must
be cast to `org.archive.util.HttpRecorder`.

## Accommodating Maven Version 1

This project is built using maven version 1. Maven version 1 configuration files are incompatible with maven version 2.x
and 3.x. There are two approaches to build this project:

### Approach 1: Migrate the project to maven version 2 compatability

This involves converting the maven configuration files to maven version 2. This is accomplished by running maven version
2 or 3 and executing:
```
mvn one:convert
```

This takes the `maven.xml`, `project.xml` and possibly the `project.properties` file and generates a `pom.xml` file that
can be used by maven version 2 or 3. This original raw converted file is `pom-converted.xml`.

The `pom.xml` that has been checked into source is the output of the `mvn one:convert` with some corrections,
notably that dependencies found in `./lib` that exist in maven central or spring plugins have been replaced with the
real dependency (see the script `install-maven2-dependencies-and-copy-to-maven1-repository.[bat|sh]` for more details).
This `pom.xml` should not be considered valid for actually building the project (it will build a jar, but that jar
will not include everything that the maven 1 approach will include). However, that `pom.xml` can be used to indicate
dependencies for the heritrix jar produced by the maven 1.x build. At this point the conversion approach has been
abandoned in favour of Approach 2. See the section *Updating the release_archive* for the use of this `pom.xml`.

### Approach 2: Build the project with maven version 1

There are several steps to this process:

1. Download and install Java 1.5 from Oracle (https://www.oracle.com/technetwork/java/javasebusiness/downloads/java-archive-downloads-javase5-419410.html).
This JVM can be run simply by setting `JAVA_HOME` to the unpacked location and including `JAVA_HOME/bin` in the shell
path. See the note on *Accommodating unit test failures* below regarding the failures that occur when building with
Java 1.8. The original `aheritrix-1.14.1.jar` was built with Java 1.5, so we are replicating that process. 

2. Download and unpack the maven 1.x distribution, the final 1.x release being 1.1, found at
http://archive.apache.org/dist/maven/binaries/. For linux, one option is to download
`http://archive.apache.org/dist/maven/binaries/maven-1.1.tar.gz`. There are some installation notes at
https://maven.apache.org/archives/maven-1.x/start/install.html.

3. You don't want to replace your existing maven distribution, so perhaps you can put this unpacked distribution in
`~/bin`. Set `MAVEN_HOME` to the location on this unpacked distribution. To run the 1.x version of maven execute in
linux:
```
$MAVEN_HOME/bin/maven <command-arguments>
```
For Windows it would be:
```
%MAVEN_HOME%\bin\maven.bat <command-arguments>
```

4. Load the necessary jars from maven2 repositories. The structure of maven 1 repositories (the local one typically
found at ~/.maven/repository) is:
```
<groupId-with-dot-separated-package-names-as-a-single-folder-name>/jars/<artifactId>-<version>.jar
```
This differs dramatically from the structure of a maven 2 repository (the local one typically found at ~/.m2/repository):
```
<groupId-with-dot-separated-package-names-as-separate-folders>/<artifact-id>/<version>/<artifactId>-<version>.jar
```
Note that there doesn't seem to be any maven1 compatible repositories on the internet (for example, the repository
`http://repo1.maven.org/maven` no longer exists and has been replaced with `http://repo1.maven.org/maven`, which isn't
compatible with maven 1). That means that all dependencies that are required will need to be downloaded to the local
maven 2 repository (`~/.m2/repository`) and then copied in the local maven 1 repository (`~/.maven/repository`). This
download and copy is accomplished by executing the bash script:
```
install-maven2-dependencies-and-copy-to-maven1-repository.sh
```
or for Windows:
```
install-maven2-dependencies-and-copy-to-maven1-repository.bat
```
These scripts also install the `commons-httpclient-heritrix-1-14` and `commons-pool-heritrix-1-14` dependencies in the
local maven 1.x repository.

## Versioning

See the `project.xml` file for the current jar version that will be generated. Previous versions have been tagged in the
git repository. To list the tags, use:
```
git tag -l
```

### Versioned artifacts

The original source files can be found in the subfolder `original_source`.

Pre-built artifacts can be found in the subfolder `release_archive`.

### Running a maven 2.x/3.x/gradle build with a heritrix 1.x dependency

When running a maven or gradle build that requires this version of heritrix, the following commands can be used to
install the dependency in a local maven 2 repository (run these commands from the root folder of this project):
```
mkdir -pv ./target/
git clone https://github.com/WebCuratorTool/heritrix-1-14-adjust.git ./target/heritrix-1-14-adjust
mvn install:install-file -Dfile=./target/heritrix-1-14-adjust/heritrix-<version>.jar -DpomFile=./target/heritrix-1-14-adjust/heritrix-<version>-pom.xml
```
TODO setup the pom file
Note that the version needs to be chosen for this script to work.

## Installation

The artifacts are built using maven and will deploy to a maven version 1 repository.


### Complete build

See ./docs/articles/developer_manual/index.html or
<http://crawler.archive.org/articles/developer_manual/index.html> for information on building heritrix.

Simply put, execute the following on linx:
```
$MAVEN_HOME/bin/maven [clean] dist
```
or for Windows:
```
%MAVEN_HOME%/bin/maven.bat [clean] dist
```

### Accommodating unit test failures

To perform a build that ignores unit test failures, execute the following on linux:
```
$MAVEN_HOME/bin/maven [clean] dist -Dmaven.test.error.ignore=true -Dmaven.test.failure.ignore=true [--debug]
```
or for Windows:
```
%MAVEN_HOME%/bin/maven.bat [clean] dist -Dmaven.test.error.ignore=true -Dmaven.test.failure.ignore=true [--debug]
```

## Notes on unit test failures

When building with:
```
java -version
java version "1.8.0_191"
Java(TM) SE Runtime Environment (build 1.8.0_191-b12)
Java HotSpot(TM) 64-Bit Server VM (build 25.191-b12, mixed mode)
```
and:
```
$MAVEN_HOME/bin/maven --version
 __  __
|  \/  |__ _Apache__ ___
| |\/| / _` \ V / -_) ' \  ~ intelligent projects ~
|_|  |_\__,_|\_/\___|_||_|  v. 1.1
```
and executing the following:
```
$MAVEN_HOME/bin/maven clean dist -Dmaven.test.error.ignore=true -Dmaven.test.failure.ignore=true
```
the list of unit test failures given below occurs. These unit test failures do *not* occur when using:
```
java -version
java version "1.5.0_22"
Java(TM) 2 Runtime Environment, Standard Edition (build 1.5.0_22-b03)
Java HotSpot(TM) 64-Bit Server VM (build 1.5.0_22-b03, mixed mode)
```

This means that there are potential issues when running Heritrix 1.14.1 with more recent JDK's. Those relevant errors
and failures are given to help with future issue resolution.

### Unit test org.archive.io.arc.ARCWriterTest
```
[junit] Running org.archive.io.arc.ARCWriterTest
[junit] Tests run: 15, Failures: 2, Errors: 2, Time elapsed: 0.219 sec
[junit] [ERROR] Test org.archive.io.arc.ARCWriterTest FAILED

Testcase: testWriteRecordCompressed(org.archive.io.arc.ARCWriterTest):	Caused an ERROR
java.io.IOException: Record ENDING at 475 has 175 trailing byte(s): /go/repos-webcurator/heritrix-1-14-adjust/target/test-tmp/writeRecordCompressed-JUNIT-20190202011421-00005.arc.gz: {subject-uri=http://www.one.net/id=0, ip-address=0.1.2.3, length=113, absolute-offset=167, creation-date=26091020212651, content-type=text/html, version=1.0}
java.lang.RuntimeException: java.io.IOException: Record ENDING at 475 has 175 trailing byte(s): /go/repos-webcurator/heritrix-1-14-adjust/target/test-tmp/writeRecordCompressed-JUNIT-20190202011421-00005.arc.gz: {subject-uri=http://www.one.net/id=0, ip-address=0.1.2.3, length=113, absolute-offset=167, creation-date=26091020212651, content-type=text/html, version=1.0}
	at org.archive.io.ArchiveReader$ArchiveRecordIterator.hasNext(ArchiveReader.java:477)
	at org.archive.io.ArchiveReader.validate(ArchiveReader.java:262)
	at org.archive.io.arc.ARCWriterTest.validate(ARCWriterTest.java:163)
	at org.archive.io.arc.ARCWriterTest.testWriteRecordCompressed(ARCWriterTest.java:245)
Caused by: java.io.IOException: Record ENDING at 475 has 175 trailing byte(s): /go/repos-webcurator/heritrix-1-14-adjust/target/test-tmp/writeRecordCompressed-JUNIT-20190202011421-00005.arc.gz: {subject-uri=http://www.one.net/id=0, ip-address=0.1.2.3, length=113, absolute-offset=167, creation-date=26091020212651, content-type=text/html, version=1.0}
	at org.archive.io.arc.ARCReaderFactory$CompressedARCReader.gotoEOR(ARCReaderFactory.java:427)
	at org.archive.io.ArchiveReader.cleanupCurrentRecord(ArchiveReader.java:192)
	at org.archive.io.ArchiveReader$ArchiveRecordIterator.hasNext(ArchiveReader.java:474)
	... 18 more


Testcase: testLengthTooShortCompressed(org.archive.io.arc.ARCWriterTest):	FAILED
Count wrong 2
junit.framework.AssertionFailedError: Count wrong 2
	at org.archive.io.arc.ARCWriterTest.lengthTooShort(ARCWriterTest.java:397)
	at org.archive.io.arc.ARCWriterTest.testLengthTooShortCompressed(ARCWriterTest.java:361)


Testcase: testLengthTooLongCompressed(org.archive.io.arc.ARCWriterTest):	FAILED
Count wrong 2
junit.framework.AssertionFailedError: Count wrong 2
	at org.archive.io.arc.ARCWriterTest.lengthTooLong(ARCWriterTest.java:451)
	at org.archive.io.arc.ARCWriterTest.testLengthTooLongCompressed(ARCWriterTest.java:416)


Testcase: testLengthTooLongCompressedStrict(org.archive.io.arc.ARCWriterTest):	Caused an ERROR
java.io.IOException: Record ENDING at 653 has 374 trailing byte(s): /go/repos-webcurator/heritrix-1-14-adjust/target/test-tmp/testLengthTooLongCompressed-JUNIT-20190202011421-00011.arc.gz: {subject-uri=http://www.archive.org/test/, ip-address=192.168.1.1, length=116, absolute-offset=170, creation-date=20190202011421, content-type=text/html, version=1.0}
java.lang.RuntimeException: java.io.IOException: Record ENDING at 653 has 374 trailing byte(s): /go/repos-webcurator/heritrix-1-14-adjust/target/test-tmp/testLengthTooLongCompressed-JUNIT-20190202011421-00011.arc.gz: {subject-uri=http://www.archive.org/test/, ip-address=192.168.1.1, length=116, absolute-offset=170, creation-date=20190202011421, content-type=text/html, version=1.0}
	at org.archive.io.ArchiveReader$ArchiveRecordIterator.hasNext(ArchiveReader.java:477)
	at org.archive.io.arc.ARCWriterTest.iterateRecords(ARCWriterTest.java:300)
	at org.archive.io.arc.ARCWriterTest.lengthTooLong(ARCWriterTest.java:450)
	at org.archive.io.arc.ARCWriterTest.testLengthTooLongCompressedStrict(ARCWriterTest.java:423)
Caused by: java.io.IOException: Record ENDING at 653 has 374 trailing byte(s): /go/repos-webcurator/heritrix-1-14-adjust/target/test-tmp/testLengthTooLongCompressed-JUNIT-20190202011421-00011.arc.gz: {subject-uri=http://www.archive.org/test/, ip-address=192.168.1.1, length=116, absolute-offset=170, creation-date=20190202011421, content-type=text/html, version=1.0}
	at org.archive.io.arc.ARCReaderFactory$CompressedARCReader.gotoEOR(ARCReaderFactory.java:427)
	at org.archive.io.ArchiveReader.cleanupCurrentRecord(ArchiveReader.java:192)
	at org.archive.io.ArchiveReader$ArchiveRecordIterator.hasNext(ArchiveReader.java:474)
	... 18 more
```

### Unit test org.archive.io.warc.WARCWriterTest
```
[junit] Running org.archive.io.warc.WARCWriterTest
[junit] Tests run: 9, Failures: 1, Errors: 2, Time elapsed: 0.151 sec
[junit] [ERROR] Test org.archive.io.warc.WARCWriterTest FAILED

Testcase: testArcRecordOffsetReads(org.archive.io.warc.WARCWriterTest):	Caused an ERROR
Failed move to EOR or failed header read: null
java.lang.RuntimeException: Failed move to EOR or failed header read: null
	at org.archive.io.GzippedInputStream$1.next(GzippedInputStream.java:239)
	at org.archive.io.warc.WARCReaderFactory$CompressedWARCReader$1.innerNext(WARCReaderFactory.java:280)
	at org.archive.io.ArchiveReader$ArchiveRecordIterator.exceptionNext(ArchiveReader.java:560)
	at org.archive.io.ArchiveReader$ArchiveRecordIterator.next(ArchiveReader.java:518)
	at org.archive.io.ArchiveReader$ArchiveRecordIterator.next(ArchiveReader.java:461)
	at org.archive.io.warc.WARCWriterTest.testArcRecordOffsetReads(WARCWriterTest.java:456)


Testcase: testRandomAccess(org.archive.io.warc.WARCWriterTest):	FAILED
expected:<0> but was:<1>
junit.framework.AssertionFailedError: expected:<0> but was:<1>
	at org.archive.io.warc.WARCWriterTest.testRandomAccess(WARCWriterTest.java:316)


Testcase: testWriteRecordCompressed(org.archive.io.warc.WARCWriterTest):	Caused an ERROR
Count of records, 1 is less than expected 3
java.io.IOException: Count of records, 1 is less than expected 3
	at org.archive.io.ArchiveReader.validate(ArchiveReader.java:279)
	at org.archive.io.warc.WARCWriterTest.validate(WARCWriterTest.java:248)
	at org.archive.io.warc.WARCWriterTest.testWriteRecordCompressed(WARCWriterTest.java:323)
```

### Unit test org.archive.util.ArchiveUtilsTest
```
[junit] Running org.archive.util.ArchiveUtilsTest
[junit] Tests run: 16, Failures: 1, Errors: 0, Time elapsed: 11.358 sec
[junit] [ERROR] Test org.archive.util.ArchiveUtilsTest FAILED

Testcase: testDoubleToString(org.archive.util.ArchiveUtilsTest):	FAILED
cecking 2 character precision
junit.framework.AssertionFailedError: cecking 2 character precision
	at org.archive.util.ArchiveUtilsTest.testDoubleToString(ArchiveUtilsTest.java:242)
```

## Updating the release_archive

When updating the release_archive with a newer version, include the `pom.xml` for that version of the project. This makes
it easier for other dependent projects (especially the webcuratortool project) to populate its local maven
repository with the pom associated with the jar. This does involving copying the `pom.xml` into `release-archive` and
renaming it to `heritrix-<version>.pom`.

**NOTE** Make sure the version found in the `pom.xml` matches the version found in the `project.xml`.

## Contributors

The original commits are attributed to the people named in the `project.xml` file. Issues are tracked through the github
repository issue tracker. Note that there is no history prior to version 1.14.1 (which is when the source was imported
into this repository). See the git commits after the tagged 1.14.1 version for those contributors.

## License

&copy; 2018 National Library of New Zealand for all changes past version 1.14.1. All rights reserved.
GNU Lesser General Public License (LGPL) version 2.1.

For code prior up to and including version 1.14.1, GNU Lesser General Public License (LGPL) version 2.1.
