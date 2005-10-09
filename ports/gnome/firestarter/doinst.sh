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
		      
gconf() {
  if [ -x usr/bin/gconftool-2 ]; then
    GCONF_CONFIG_SOURCE=`gconftool-2 --get-default-source` \
    usr/bin/gconftool-2 --makefile-install-rule $1 >/dev/null 2>&1
  fi
}
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database >/dev/null 2>&1
fi

config etc/rc.d/rc.firewall.new
