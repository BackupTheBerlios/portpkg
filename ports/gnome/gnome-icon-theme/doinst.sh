icons() {
  if [ -x usr/bin/gtk-update-icon-cache ]; then
    usr/bin/gtk-update-icon-cache -ft `dirname $1` >/dev/null 2>&1
  fi
}
