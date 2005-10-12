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

# keep file mask of import-scripts
for i in etc/portpkg/plugins/sync.*.new; do
  if [ -x etc/portpkg/plugins/`basename $i .new` ]; then
    chmod 755 $i
  fi
  mv $i etc/portpkg/plugins/`basename $i .new`
done

# rename all export scripts
for i in etc/portpkg/plugins/export.*.new; do
  mv $i etc/portpkg/plugins/`basename $i .new`
done

# export.http is default
if ! [ -L etc/portpkg/export ]; then
  ln -s plugins/export.http etc/portpkg/export
fi

for i in etc/portpkg/*.new; do
  config $i
done
