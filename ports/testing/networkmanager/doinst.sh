config() {
  NEW="$1"
  OLD="`dirname $NEW`/`basename $NEW .new`"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "`cat $OLD | md5sum`" = "`cat $NEW | md5sum`" ]; then # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}
if ! grep -sq "/etc/rc.d/rc.networkmanager start" etc/rc.d/rc.local; then
  cat <<EOF >>etc/rc.d/rc.local

if [ -x /etc/rc.d/rc.networkmanager ]; then
  /sbin/dhcdbd -s
  /etc/rc.d/rc.networkmanager start
fi
EOF
fi
if ! grep -sq "/etc/rc.d/rc.networkmanager stop" etc/rc.d/rc.local_shutdown; then
  cat <<EOF >>etc/rc.d/rc.local_shutdown

if [ -x /etc/rc.d/rc.networkmanager ]; then
  /etc/rc.d/rc.networkmanager stop
fi
EOF
fi
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database >/dev/null 2>&1
fi
