mkdir -p etc/gtk-2.0
if [ -x usr/bin/gtk-query-immodules-2.0 ]; then
  usr/bin/gtk-query-immodules-2.0 >etc/gtk-2.0/gtk.immodules
fi
if [ -x usr/bin/gdk-pixbuf-query-loaders ]; then
  usr/bin/gdk-pixbuf-query-loaders >etc/gtk-2.0/gdk-pixbuf.loaders 2>&1
fi
