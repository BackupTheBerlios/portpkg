gconf() {
  if [ -x usr/bin/gconftool-2 ]; then
    GCONF_CONFIG_SOURCE=`gconftool-2 --get-default-source` \
    usr/bin/gconftool-2 --makefile-install-rule $1 >/dev/null 2>&1
  fi
}
gconf etc/gconf/schemas/desktop_default_applications.schemas
gconf etc/gconf/schemas/desktop_gnome_url_handlers.schemas
gconf etc/gconf/schemas/system_dns_sd.schemas
gconf etc/gconf/schemas/system_http_proxy.schemas
gconf etc/gconf/schemas/system_smb.schemas
