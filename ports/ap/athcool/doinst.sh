if ! grep -sq "/usr/sbin/athcool on" etc/rc.d/rc.local; then
  cat >>etc/rc.d/rc.local <<EOF

if [ -x /usr/sbin/athcool ]; then
  echo "Activating Athlon power saving mode:  /usr/sbin/athcool on"
  /usr/sbin/athcool on >/dev/null
fi
EOF
fi
