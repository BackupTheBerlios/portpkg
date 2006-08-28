icons() {
  if [ -x usr/bin/gtk-update-icon-cache ]; then
    usr/bin/gtk-update-icon-cache -f `dirname $1` >/dev/null 2>&1
  fi
}
