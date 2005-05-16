if [ -x usr/bin/gst-register ]; then
  sbin/ldconfig >/dev/null 2>&1
  usr/bin/gst-register >/dev/null 2>&1
fi
gconf() {
  if [ -x usr/bin/gconftool-2 ]; then
    GCONF_CONFIG_SOURCE=`gconftool-2 --get-default-source` \
    usr/bin/gconftool-2 --makefile-install-rule $1 >/dev/null 2>&1
  fi
}
gconf etc/gconf/schemas/gstreamer-0.8.schemas
gconf etc/gconf/schemas/gstreamer.schemas
