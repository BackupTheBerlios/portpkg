gconf() {
  if [ -x /usr/bin/gconftool-2 ]; then
    GCONF_CONFIG_SOURCE=`gconftool-2 --get-default-source` \
    gconftool-2 --makefile-install-rule $1 >/dev/null 2>&1
  fi
}
gconf etc/gconf/schemas/clock.schemas
gconf etc/gconf/schemas/fish.schemas
gconf etc/gconf/schemas/panel-compatibility.schemas
gconf etc/gconf/schemas/panel-default-setup.entries
gconf etc/gconf/schemas/panel-general.schemas
gconf etc/gconf/schemas/panel-global.schemas
gconf etc/gconf/schemas/panel-object.schemas
gconf etc/gconf/schemas/panel-toplevel.schemas
gconf etc/gconf/schemas/window-list.schemas
gconf etc/gconf/schemas/workspace-switcher.schemas
if [ -x usr/bin/scrollkeeper-update ]; then
  usr/bin/scrollkeeper-update -p var/lib/scrollkeeper >/dev/null 2>&1
fi
