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
useradd privoxy 2>/dev/null
if ! grep -sqw /etc/rc.d/rc.privoxy etc/rc.d/rc.local; then
  cat >>etc/rc.d/rc.local <<EOF

# Start the privoxy daemon:
if [ -x /etc/rc.d/rc.privoxy ]; then
  /etc/rc.d/rc.privoxy start
fi
EOF
fi
