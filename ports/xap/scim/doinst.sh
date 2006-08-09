if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database >/dev/null 2>&1
fi
if [ -x usr/bin/gtk-query-immodules-2.0 ]; then
  mkdir -p etc/gtk-2.0
  usr/bin/gtk-query-immodules-2.0 >etc/gtk-2.0/gtk.immodules
fi
