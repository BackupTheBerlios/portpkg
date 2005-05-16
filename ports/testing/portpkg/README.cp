About The Portpkg Project

   Portpkg is a ports system for Slackware Linux. Its purpose is to build and
   manage a larger set of software for Slackware.

   This is done not by provding binary packages, but by collecting scripts
   that download, compile and install software on your machine. The
   implementation is very simple and automated while still gaining the
   maximum possible "Slackwareness". Contribution of own ports is realised by
   uploading them onto our server which commits them into an open directory.
   Our Crew will later merge them into the ports tree.

   --------------------------------------------------------------------------

To-Do-List

     o Double check all ports. Make them 100 % work on Slackware 10.0.
     o Support for CVS or maybe RSYNC, SVN in sources.
     o Cooperation with slackpkg (or slapt-get/swaret) for dependency
       resolution of Slackware packages?
     o ignore for single ports
     o sort of suggest for ports?
     o Feature freeze, then beta-status, documentation, maybe translation.

   Already done:

     o Integrated pp-sync-bin into portpkg --sync
     o Costumiseable paths for source code and packages
     o Use of CFLAGS
     o Always prefer $PRT_DIR/local
     o Build-only for fakerooted ports
     o Fakeroot: Building packages as user.
     o Data integrity checking (half done: md5sums)
     o Lazy upgrading: don't upgrade any dependencies just to install a
       library that doesn't need that.
     o Support for three architectures: i486, s390 and x86_64. i486 is the
       default architecture, so our ports have either ARCH=noarch or
       ARCH=${ARCH:-i486} in the SlackBuild, portpkg detects the architecure
       and passes $ARCH with to the SlackBuild.
     o Simple slot system: Ports that don't replace an existing different
       version have an empty file slot-in.
     o Removed addport and export from ports and integrated with Portpkg.
     o Localised mirrors-files (half-done): Users can link mirrors to
       mirrors.xx (only .de for now).
     o Found a way to get over the differences between stable (10.0) and
       current (could be improved): Some ports need newer versions of a
       dependency that is not in 10.0 (stable), but in current. And current
       system shouldn't need to compile that again. These ports have moved to
       pasture/, which has to be excluded in exclude.local by users of
       current-systems.

   --------------------------------------------------------------------------

Contribute / Jobs

   If you want to contribute to this project, then read on, there're many
   ways to help us:

  Bug Reporting

     o If you use portpkg and something doesn't work, upload the buildlog!
       You can find it in /tmp, it is called buildlog-<portname>, go to
       http://portpkg.berlios.de and click browse and upload it. This is
       anonymous, and helps a lot!
     o If you have a clue what is borked, send a short bug-report on
       http://portpkg.berlios.de.
     o If you know how to fix a broken SlackBuild and want to code directly
       as a maintainer, ask me for a CVS-account!

  Contributing Ports

     o Make ports you missed in the ports collection. A good starting point
       is the addport script in /usr/ports (EDIT: or autoport from the
       portpkg package). See also QuickStart and MaintainerGuide. Upload them
       on http://portpkg.berlios.de with the panel on the right. They will be
       automatically committed into the group open/ within the next hour and
       checked later to be merged to the collection.
     o If you miss dependencies or descriptions or something leave a message
       for the maintainer.
     o If you find annoying dependencies being actually optional, tell us.

  Wanted

     o Maintainers for KDE applications
     o Maintainers who are interested in taking over a few of my (Tom) ports
     o Is someone interested in hosting binary packages?

   --------------------------------------------------------------------------

Known Bugs

   These are often reported bugs. Please do so and send your buildlog, if
   something hangs.

   Portpkg
           * Sync does nothing: Because we moved the tree from http to cvs,
             there might be problems to sync your tree. Work around: Remove
             your ports tree, and try again. Make sure you have version 0.28
             or higher.

   Ports
           * SlackBuilds look for .gz while sources has .bz2 or vice-versa.
           * Incomplete requirements-list, portpkg stops.

   --------------------------------------------------------------------------

Contact

   As always, feel free to contact me: Tom <topf at users dot berlios dot
   de>.

   --------------------------------------------------------------------------


References

   Visible links
   . http://portpkg.berlios.de/
   . http://portpkg.berlios.de/
   . file:///usr/ports/d/portpkg/doc.php?page=QuickStart
   . file:///usr/ports/d/portpkg/doc.php?page=MaintainerGuide
   . http://portpkg.berlios.de/
   . file:///usr/ports/d/portpkg/doc.php?page=edit/TodoBugsAbout
   . file:///usr/ports/d/portpkg/doc.php?page=links/TodoBugsAbout
   . file:///usr/ports/d/portpkg/doc.php?page=info/TodoBugsAbout
