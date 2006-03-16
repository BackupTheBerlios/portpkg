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
config etc/rc.d/rc.hal.new

if ! grep "^haldaemon:x:" etc/passwd >/dev/null 2>&1; then
  echo "haldaemon:x:61:61:haldaemon:/etc/hal:" >>etc/passwd
fi
if ! grep "^haldaemon::" etc/group >/dev/null 2>&1; then
  echo "haldaemon::61:haldaemon" >>etc/group
fi
if ! grep "^haldaemon:" etc/shadow >/dev/null 2>&1; then
  echo "haldaemon:*:9797:0:::::" >>etc/shadow
fi

if ! grep -sq "/etc/rc.d/rc.hal start" etc/rc.d/rc.local; then
cat <<EOF >>etc/rc.d/rc.local

if [ -x /etc/rc.d/rc.hal ]; then
  /etc/rc.d/rc.hal start
fi
EOF
fi
