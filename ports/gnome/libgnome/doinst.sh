config()
{
  case $1 in
  *.new)
    new=`echo $1 | sed "s,\.new$,,"`
    if [ ! -f $new ]; then
      mv $1 $new
    elif cmp -s $1 $new; then
      rm $1
    fi;;
  *.omf)
    scrollkeeper-update -p var/lib/scrollkeeper -o $1 >/dev/null 2>&1;;
  *.schemas)
    GCONF_CONFIG_SOURCE=`gconftool-2 --get-default-source` \
    gconftool-2 --makefile-install-rule $1 >/dev/null 2>&1;;
  esac
}
