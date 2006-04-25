if ! grep -sq "/etc/rc.d/rc.laptop-mode" etc/rc.d/rc.local; then
cat <<EOF >>etc/rc.d/rc.local
if [ -x /etc/rc.d/rc.laptop-mode ]; then
  /etc/rc.d/rc.laptop-mode restart
fi
EOF
fi
