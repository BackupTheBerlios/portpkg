update() {
  if ! [ -f $1 ]; then
    mv $1.incoming $1
  else
    cat $1.incoming >$1
    rm $1.incoming
  fi
}
if ! grep -sq "/etc/rc.d/rc.system-tools-backends" etc/rc.d/rc.local; then
  cat >>etc/rc.d/rc.local <<EOF

if [ -x /etc/rc.d/rc.system-tools-backends ]; then
  /etc/rc.d/rc.system-tools-backends start
fi
EOF
fi
update etc/rc.d/rc.system-tools-backends
