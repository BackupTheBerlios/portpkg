if [ -x usr/bin/gdk-pixbuf-query-loaders ]; then
  mkdir -p etc/gtk-2.0
  usr/bin/gdk-pixbuf-query-loaders >etc/gtk-2.0/gdk-pixbuf.loaders 2>&1
fi
