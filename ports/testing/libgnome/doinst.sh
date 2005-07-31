gconf() {
  if [ -x usr/bin/gconftool-2 ]; then
    GCONF_CONFIG_SOURCE=`gconftool-2 --get-default-source` \
    usr/bin/gconftool-2 --makefile-install-rule $1 >/dev/null 2>&1
  fi
}
