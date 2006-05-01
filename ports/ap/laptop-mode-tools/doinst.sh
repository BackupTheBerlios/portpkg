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
config etc/laptop-mode/laptop-mode.conf.new
config etc/laptop-mode/lm-profiler.conf.new
config etc/rc.d/rc.laptop-mode.new
if ! grep -sq "/etc/rc.d/rc.laptop-mode" etc/rc.d/rc.local; then
cat <<EOF >>etc/rc.d/rc.local
if [ -x /etc/rc.d/rc.laptop-mode ]; then
  /etc/rc.d/rc.laptop-mode restart
fi
EOF
fi
