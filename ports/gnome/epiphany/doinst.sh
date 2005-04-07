if [ -x usr/bin/scrollkeeper-update ]; then
  usr/bin/scrollkeeper-update >/dev/null 2>&1
fi
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database >/dev/null 2>&1
fi
