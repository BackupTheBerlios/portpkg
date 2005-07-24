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
