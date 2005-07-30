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
id=messagebus
grep -q ^$id: etc/group || groupadd $id
grep -q ^$id: etc/passwd || useradd $id -g $id


config etc/rc.d/rc.messagebus.new
config etc/dbus-1/session.conf.new
config etc/dbus-1/system.conf.new
