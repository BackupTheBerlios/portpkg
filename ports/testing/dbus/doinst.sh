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
#if ! grep "^messagebus:x:" etc/passwd >/dev/null 2>&1; then
#  echo "messagebus:x:60:60:messagebus:/etc/messagebus:" >>etc/passwd
#fi
#if ! grep "^messagebus::" etc/group >/dev/null 2>&1; then
#  echo "messagebus::60:messagebus" >>etc/group
#fi
#if ! grep "^messagebus:" etc/shadow >/dev/null 2>&1; then
#  echo "messagebus:*:9797:0:::::" >>etc/shadow
#fi
if ! grep -sq "/etc/rc.d/rc.messagebus start" etc/rc.d/rc.local; then
cat <<EOF >>etc/rc.d/rc.local

if [ -x /etc/rc.d/rc.messagebus ]; then
  /etc/rc.d/rc.messagebus start
fi
EOF
fi
