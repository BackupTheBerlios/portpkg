if [ ! -r etc/shells ]; then
  touch etc/shells
  chmod 644 etc/shells
fi

if fgrep "/usr/bin/scponly" etc/shells 1> /dev/null 2> /dev/null ; then
  true
else
  echo "/usr/bin/scponly" >> etc/shells
fi

if fgrep "/usr/sbin/scponlyc" etc/shells 1> /dev/null 2> /dev/null ; then
  true
else
  echo "/usr/sbin/scponlyc" >> etc/shells
fi
