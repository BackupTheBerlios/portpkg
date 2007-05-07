mkdir -p etc/pango
usr/bin/pango-querymodules > etc/pango/pango.modules

if [ ! -r etc/pango/pangox.aliases ]; then
	mv etc/pango/pangox.aliases{.new,}
fi
