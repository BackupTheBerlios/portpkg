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

config etc/rc.d/rc.modules-2.6.11.10.new

if [ -r etc/rc.d/rc.modules -a ! -L etc/rc.d/rc.modules ]; then
 cp -a etc/rc.d/rc.modules etc/rc.d/rc.modules.bak
fi

if [ ! -L etc/rc.d/rc.modules ]; then
 ( cd etc/rc.d ; rm -rf rc.modules )
 ( cd etc/rc.d ; ln -sf rc.modules-2.6.11.10 rc.modules )
fi
 
if [ -x sbin/depmod ]; then
 chroot . /sbin/depmod -a 1> /dev/null 2> /dev/null
fi

