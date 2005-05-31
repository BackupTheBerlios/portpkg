WARNING! THIS IS AN EXPERIMENTAL TESTING RELEASE!

* Due to some changes to the download subroutine, there's a change in the
  repos layout! Please watch out! It should be now possible to use CVS as a
  resource in your ports. E.g. the "sources" file will look like this (as in
  "repos" now):

  cvs://:pserver:anonymouse@cvs.bla.net:/cvsroot/bla/$NAME

  The default CVS storage dir is /usr/src/cvs and can be changed by CVS_DIR=...
  in /etc/portpkg/local.conf. Portpkg makes a symlink to the port dir before
  starting the SlackBuild. Use it in your SlackBuild as

  ...
  # here would be normal tar xjvf $CWD/$NAME-$VERSION.tar.bz2
  cp -av $CWD/$NAME/ . # <-- watch out the trailing /
  cd $NAME || exit 1
  ...

* PGP/GPG-Support

  In maintainer mode "md5sums" files are signed. It is verified in
  non-maintainer mode.

* OK, I restored the old importers style and delayed the "repo" config file,
  as it seems to be unneccessary. The CVS server can neverteless be 
  modified in a mirrors file.

Furthermore:

Portpkg:
* Handle optional dependencies in "requires" now as "# optional: dependency".
* Add newly found dependencies as optional.
* Connect arguments in --find with AND not OR.
* Fixed using of custom $TMP
* Use cvs:// in sources
* Removed "pseudo" files
* Remove arbitrary source files (%-style in "sources") after package building
* No more "arbitrary" files, only warning message
* Use "use"-list: install optional dependencies listed in /etc/portpkg/use
* No more ".wgetlogs"
* Don't log a dry-run
* Execute SlackBuilds with "sh -e" on default
* Try to GPG-sign md5sums
* Developers: CVS submit via --export ("SUBMIT_METHOD=cvs")
* --ignorearch: neglect architecture diffs
* Improvements to the Slackware source importer
*

Autoport:
* Support also .patch.gz and doinst.gz
* Check for KDEDIRS and use prefix /opt/kde
* Add schemas files explicit to doinst.sh
* Removed "|| exit 1"
* Remove empty files in /usr/share/mime/
* Support CVS sources
*

* Some more changes.

Enjoy.
--tom

Delayed:
* Added support for different repositories (CVS and HTTPUP) (see /etc/portpkg/repos).
* Removed "importers" subsystem.
