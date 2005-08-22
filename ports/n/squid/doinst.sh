#!/bin/sh
# If the squid user/group don't exist, add them:
if ! grep -q squid /etc/group; then
  groupadd squid
fi

if ! grep -q squid /etc/passwd; then
  useradd -g squid -d /var/spool/squid -c "Squid User" -s /bin/false squid
fi

# Chown the spool dir and log dir to squid user/group
for i in /var/log/squid /var/spool/squid ; do
	if [ -d $i ] ; then
		for adir in `find $i -maxdepth 0 \! -user squid`; do
			chown -R squid.squid $adir
		done
	fi
done

# handle config files
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
config etc/squid/mime.conf.new
config etc/squid/squid.conf.new
config etc/squid/msntauth.conf.new
