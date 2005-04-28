gconf() {
  if [ -x usr/bin/gconftool-2 ]; then
    GCONF_CONFIG_SOURCE=`gconftool-2 --get-default-source` \
    usr/bin/gconftool-2 --makefile-install-rule $1 >/dev/null 2>&1
  fi
}
gconf etc/gconf/schemas/apps_gnome_settings_daemon_default_editor.schemas
gconf etc/gconf/schemas/apps_gnome_settings_daemon_keybindings.schemas
gconf etc/gconf/schemas/apps_gnome_settings_daemon_screensaver.schemas
gconf etc/gconf/schemas/desktop_gnome_font_rendering.schemas
gconf etc/gconf/schemas/desktop_gnome_peripherals_keyboard_xkb.schemas
gconf etc/gconf/schemas/fontilus.schemas
gconf etc/gconf/schemas/themus.schemas
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database >/dev/null 2>&1
fi
