if [ -x usr/bin/gst-register ]; then
  sbin/ldconfig >/dev/null 2>&1
  usr/bin/gst-register >/dev/null 2>&1
fi
#gconf etc/gconf/schemas/gstreamer-0.8.schemas
#gconf etc/gconf/schemas/gstreamer.schemas
