if [ -x usr/bin/scrollkeeper-update ]; then
  usr/bin/scrollkeeper-update -p var/lib/scrollkeeper >/dev/null 2>&1
fi
if [ -x usr/bin/update-mime-database ]; then
  usr/bin/update-mime-database usr/share/mime >/dev/null 2>&1
fi
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database >/dev/null 2>&1
fi
