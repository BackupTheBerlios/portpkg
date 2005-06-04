gconf() {
  if [ -x usr/bin/gconftool-2 ]; then
    GCONF_CONFIG_SOURCE=`gconftool-2 --get-default-source` \
    usr/bin/gconftool-2 --makefile-install-rule $1 >/dev/null 2>&1
  fi
}
gconf etc/gconf/schemas/battstat.schemas
gconf etc/gconf/schemas/charpick.schemas
gconf etc/gconf/schemas/cpufreq-applet.schemas
gconf etc/gconf/schemas/drivemount.schemas
gconf etc/gconf/schemas/geyes.schemas
gconf etc/gconf/schemas/gswitchit.schemas
gconf etc/gconf/schemas/gtik.schemas
gconf etc/gconf/schemas/gweather.schemas
gconf etc/gconf/schemas/mini-commander-global.schemas
gconf etc/gconf/schemas/mini-commander.schemas
gconf etc/gconf/schemas/mixer.schemas
gconf etc/gconf/schemas/multiload.schemas
gconf etc/gconf/schemas/stickynotes.schemas
if [ -x usr/bin/scrollkeeper-update ]; then
  usr/bin/scrollkeeper-update -p var/lib/scrollkeeper >/dev/null 2>&1
fi
