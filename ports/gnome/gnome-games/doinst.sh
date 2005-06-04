if [ -d var/lib/games/tmp ]; then
  ( cd var/lib/games/tmp
    for file in * ; do
      if [ ! -r ../$file ]; then
        mv $file ..
      fi
    done )
  rm -rf var/lib/games/tmp
fi
gconf() {
  if [ -x usr/bin/gconftool-2 ]; then
    GCONF_CONFIG_SOURCE=`gconftool-2 --get-default-source` \
    usr/bin/gconftool-2 --makefile-install-rule $1 >/dev/null 2>&1
  fi
}
gconf etc/gconf/schemas/aisleriot.schemas
gconf etc/gconf/schemas/blackjack.schemas
gconf etc/gconf/schemas/gataxx.schemas
gconf etc/gconf/schemas/glines.schemas
gconf etc/gconf/schemas/gnect.schemas
gconf etc/gconf/schemas/gnibbles.schemas
gconf etc/gconf/schemas/gnobots2.schemas
gconf etc/gconf/schemas/gnome-stones.schemas
gconf etc/gconf/schemas/gnometris.schemas
gconf etc/gconf/schemas/gnomine.schemas
gconf etc/gconf/schemas/gnotravex.schemas
gconf etc/gconf/schemas/gnotski.schemas
gconf etc/gconf/schemas/gtali.schemas
gconf etc/gconf/schemas/iagno.schemas
gconf etc/gconf/schemas/libgnomegames.schemas
gconf etc/gconf/schemas/mahjongg.schemas
gconf etc/gconf/schemas/same-gnome.schemas
if [ -x usr/bin/scrollkeeper-update ]; then
  usr/bin/scrollkeeper-update -p var/lib/scrollkeeper >/dev/null 2>&1
fi
if [ -x usr/bin/update-mime-database ]; then
  usr/bin/update-mime-database usr/share/mime >/dev/null 2>&1
fi
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database >/dev/null 2>&1
fi
