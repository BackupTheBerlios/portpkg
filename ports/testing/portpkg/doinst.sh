# keep file mask of importers
for i in portpkg-tree pseudo-ports slackware-source; do
  if [ -x etc/portpkg/importers/$i ]; then
    chmod 755 etc/portpkg/importers/$i.new
  fi
  mv etc/portpkg/importers/$i{.new,}
done

# export.http is default
if ! [ -f etc/portpkg/export ]; then
  ln -s export.http etc/portpkg/export
fi
