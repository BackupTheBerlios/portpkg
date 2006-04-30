if [ -x usr/bin/gst-register ]; then
  sbin/ldconfig >/dev/null 2>&1
  usr/bin/gst-register >/dev/null 2>&1
fi
