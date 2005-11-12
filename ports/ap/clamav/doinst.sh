#!/bin/sh

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
config etc/clamav/clamd.conf.new
config etc/clamav/freshclam.conf.new

if [ -z `id -g clamav 2> /dev/null` ]; then 
    groupadd clamav
fi
if [ -z `id -u clamav  2> /dev/null` ]; then
    useradd -g clamav -s /bin/false -c "Clam AntiVirus" -d /etc/clamav clamav
fi

