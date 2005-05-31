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
#config etc/portpkg/exclude.new
#config etc/portpkg/repos.new

for i in pseudo-ports slackware-source; do
  if [ -x etc/portpkg/importers/$i ]; then
    chmod 755 etc/portpkg/importers/$i.new
  fi
  mv etc/portpkg/importers/$i{.new,}
done

## ok this is a hot-fix for 0.35cvs-7tom/8tom:
#if ! [ -c dev/stdout ] && ! [ -L dev/stdout ]; then
#  # stdout is not a character device file or a symlink to one
#  # move what's left to root
#  mv dev/stdout root/
#  # symlink to fd/1
#  ln -s fd/1 dev/stdout
#  echo "FIXED /DEV/STDOUT, PLEASE CHECK IT:" >&2
#  ls -l dev/stdout >&2
#fi
