# heritrix-1-14-adjust
An adjusted version of heritrix-1.14.1 to work with updated dependencies.

## Synopsis

The heritrix-1.14.1.jar includes Apache commons-httpclient code in its jar instead of relying on an external dependency.
Unfortunately, this version packaged with the code conflicts with commons-httpclient versions used with the
Web Curator Tool (https://github.com/DIA-NZ/webcurator).

This version attempts to correct the conflicts with commons-httpclient version 3.1.

## Motivation

Provide a clean set of dependencies so the heritrix 1.14.1 crawler can work without classpath conflicts.

## Important

At this time there is no important information to impart.

## Versioning

See the `project.xml` file for the current jar version that will be generated.

## Installation

The artifacts are built using maven and will deploy to a maven repository.

### Complete build
See ./docs/articles/developer_manual/index.html or
<http://crawler.archive.org/articles/developer_manual/index.html> for information on building heritrix.

## Contributors

See git commits to see who contributors are. Issues are tracked through the git repository issue tracker. Note that
there is no history prior to version 1.14.1 (which is when the source was imported into this repository).

## License

&copy; 2018 National Library of New Zealand for all changes past version 1.14.1. All rights reserved.
GNU Lesser General Public License (LGPL) version 2.1.

For code prior up to and including version 1.14.1, GNU Lesser General Public License (LGPL) version 2.1.
