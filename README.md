# heritrix-1-14-adjust
An adjusted version of heritrix-1.14.1 to work with updated dependencies.

## Synopsis

The heritrix-1.14.1.jar includes Apache commons-httpclient code in its jar instead of relying on an external dependency.
Unfortunately, this version packaged with the code conflicts with commons-httpclient versions used with the
Web Curator Tool (https://github.com/DIA-NZ/webcurator).

This version attempts to correct the conflicts with commons-httpclient version 3.1.

## Motivation

Provide a non-conflicting set of dependencies so the heritrix 1.14.1 crawler can work without classpath conflicts.

## Accomodating Maven Version 1

This project is built using maven version 1. Maven version 1 configuration files are incompatible with maven version 2.x
and 3.x. There are two approaches to build this project:

### Approach 1: Migrate the project to maven version 2 compatability

This involves converting the maven configuration files to maven version 2. This is accomplished by running maven version
2 or 3 and executing:
```
mvn one:convert
```

This takes the `maven.xml`, `project.xml` and possibly the `project.properties` file and generates a `pom.xml` file that
can be used by maven version 2 or 3. This file still needs work to correct some errors (such as missing plugin groupId
and versions). And there's no telling how much work is required to actually make it function like a regular maven 1.x
build.

Currently there is a pom.xml that has been checked in as the output of the `mvn one:convert` with some corrections, but
at this point this approach has been abandoned in favour of Approach 2.

### Approach 2: Build the project with maven version 1

There are several steps to this process:

1. Download and unpack the maven 1.x distribution, the final 1.x release being 1.1, found at
http://archive.apache.org/dist/maven/binaries/. For linux, one option is to download
`http://archive.apache.org/dist/maven/binaries/maven-1.1.tar.gz`. There are some installation notes at
https://maven.apache.org/archives/maven-1.x/start/install.html.

2. You don't want to replace your existing maven distribution, so perhaps you can put this unpacked distribution in
`~/bin`. Set `MAVEN_HOME` to the location on this unpacked distribution. To run the 1.x version of maven execute in
linux:
```
$MAVEN_HOME/bin/maven <command-arguments>
```
For Windows it would be:
```
%MAVEN_HOME%\bin\maven.bat <command-arguments>
```

3. Load the necessary jars from maven2 repositories. The structure of maven 1 repositories (the local one typically
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
download-maven2-dependencies-and-copy-to-maven1-repository.sh
```
or for Windows:
```
download-maven2-dependencies-and-copy-to-maven1-repository.bat
```

## Versioning

See the `project.xml` file for the current jar version that will be generated.

## Installation

The artifacts are built using maven and will deploy to a maven version 1 repository.

### Complete build

See ./docs/articles/developer_manual/index.html or
<http://crawler.archive.org/articles/developer_manual/index.html> for information on building heritrix.

Simply put, execute the following on linx:
```
$MAVEN_HOME/bin/maven dist
```
or for Windows:
```
%MAVEN_HOME/bin/maven.bat dist
```

## Contributors

See git commits to see who contributors are. Issues are tracked through the git repository issue tracker. Note that
there is no history prior to version 1.14.1 (which is when the source was imported into this repository).

## License

&copy; 2018 National Library of New Zealand for all changes past version 1.14.1. All rights reserved.
GNU Lesser General Public License (LGPL) version 2.1.

For code prior up to and including version 1.14.1, GNU Lesser General Public License (LGPL) version 2.1.
