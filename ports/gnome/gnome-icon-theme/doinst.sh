icons() {
  if [ -x usr/bin/gtk-update-icon-cache ]; then
    usr/bin/gtk-update-icon-cache -ft `dirname $1` >/dev/null 2>&1
  fi
}
if [ -x usr/bin/gtk-update-icon-cache ]; then
  usr/bin/gtk-update-icon-cache -ft usr/share/icons/hicolor >/dev/null 2>&1
fi
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 2>/dev/null
fi
