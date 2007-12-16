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
update() {
  if ! [ -f $1 ]; then
    mv $1.incoming $1
  else
    cat $1.incoming >$1
    rm $1.incoming
  fi
}
if ! grep -sqw /etc/rc.d/rc.tor etc/rc.d/rc.local; then
  cat >>etc/rc.d/rc.local <<EOF

# Start the tor daemon:
if [ -x /etc/rc.d/rc.tor ]; then
  /etc/rc.d/rc.tor start
fi
EOF
fi
chown daemon.daemon var/lib/tor/* 2>/dev/null
update etc/rc.d/rc.tor
