## Slackware install script for postfix
##   20011231 Gian Luca Matteucci
##   20030828 Manolis Tzanidakis
##   20040508 Nelson Mok
##   20040721 Phil Freeman
##   20050315 Stefano Stabellini
#

config() {
        NEW="$1"
        OLD="`dirname $NEW`/`basename $NEW .new`"
        # If there's no config file by that name, mv it over:
        if [ ! -r $OLD ]; then
                mv $NEW $OLD
        elif [ "`cat $OLD | md5sum`" = "`cat $NEW | md5sum`" ]; then
                # toss the redundant copy
                rm $NEW
        fi
        # Otherwise, we leave the .new copy for the admin to consider...
}

config etc/postfix/access.new
config etc/postfix/aliases.new
config etc/postfix/canonical.new
config etc/postfix/header_checks.new
config etc/postfix/main.cf.new
config etc/postfix/makedefs.out.new
config etc/postfix/master.cf.new
config etc/postfix/postfix-files.new
config etc/postfix/relocated.new
config etc/postfix/transport.new
config etc/postfix/virtual.new
config etc/rc.d/rc.postfix.new
config etc/postfix/TLS_LICENSE.new
config etc/postfix/generic.new

# check if required user & groups exist &
# otherwise add them
if ! grep -q postfix /etc/group; then
        groupadd postfix
fi
if ! grep -q postdrop /etc/group; then
        groupadd postdrop
fi
if ! grep -q postfix /etc/passwd; then
        useradd -g postfix -d /var/spool/postfix -c "The postfix MTA" -s /bin/false postfix
fi    

( cd usr/bin ; rm -rf newaliases.postfix )
( cd usr/bin ; ln -sf ../../usr/sbin/sendmail.postfix newaliases.postfix )
( cd usr/bin ; rm -rf mailq.postfix )
( cd usr/bin ; ln -sf ../../usr/sbin/sendmail.postfix mailq.postfix )

( echo -n "Running post-install:" )
( cd etc/postfix ; ./post-install command_directory=/usr/sbin/ create-missing ; echo -n " create-missing" )
( cd etc/postfix ; ./post-install command_directory=/usr/sbin/ upgrade-package ; echo " upgrade-package" )
( echo -n "Setting up config: myhostname and mydomain" )
( /usr/sbin/postconf -e myhostname=`/bin/hostname -f` ; /usr/sbin/postconf -e mydomain=`/bin/hostname -d`)
( cd etc/postfix ; ./post-install command_directory=/usr/sbin/ first-install-reminder )

