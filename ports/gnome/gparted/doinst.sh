
if which gnomesu >/dev/null 2>&1; then
  sed -i "/^Exec=/s,=,=gnomesu ," usr/share/applications/gparted.desktop
elif which gksu; then
  sed -i "/^Exec=/s,=,=gksu -u root ," usr/share/applications/gparted.desktop
fi
if [ -x usr/bin/gtk-update-icon-cache ]; then
  usr/bin/gtk-update-icon-cache -ft usr/share/icons/hicolor >/dev/null 2>&1
fi
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database >/dev/null 2>&1
fi
