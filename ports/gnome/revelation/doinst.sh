inst()
{
  case $1 in
  *.omf)
    scrollkeeper-update -p var/lib/scrollkeeper -o $1 >/dev/null 2>&1;;
  *.schemas)
    GCONF_CONFIG_SOURCE=`gconftool-2 --get-default-source` \
    gconftool-2 --makefile-install-rule $1 >/dev/null 2>&1;;
  esac
}

update-desktop-database /usr/share/applications
update-mime-database /usr/share/mime

