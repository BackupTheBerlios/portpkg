gconf() {
  if [ -x usr/bin/gconftool-2 ]; then
    GCONF_CONFIG_SOURCE=`gconftool-2 --get-default-source` \
    usr/bin/gconftool-2 --makefile-install-rule $1 >/dev/null 2>&1
  fi
}
gconf etc/gconf/schemas/desktop_gnome_accessibility_keyboard.schemas
gconf etc/gconf/schemas/desktop_gnome_accessibility_startup.schemas
gconf etc/gconf/schemas/desktop_gnome_applications_browser.schemas
gconf etc/gconf/schemas/desktop_gnome_applications_help_viewer.schemas
gconf etc/gconf/schemas/desktop_gnome_applications_terminal.schemas
gconf etc/gconf/schemas/desktop_gnome_applications_window_manager.schemas
gconf etc/gconf/schemas/desktop_gnome_background.schemas
gconf etc/gconf/schemas/desktop_gnome_file_views.schemas
gconf etc/gconf/schemas/desktop_gnome_interface.schemas
gconf etc/gconf/schemas/desktop_gnome_lockdown.schemas
gconf etc/gconf/schemas/desktop_gnome_peripherals_keyboard.schemas
gconf etc/gconf/schemas/desktop_gnome_peripherals_mouse.schemas
gconf etc/gconf/schemas/desktop_gnome_sound.schemas
gconf etc/gconf/schemas/desktop_gnome_thumbnailers.schemas
gconf etc/gconf/schemas/desktop_gnome_typing_break.schemas
