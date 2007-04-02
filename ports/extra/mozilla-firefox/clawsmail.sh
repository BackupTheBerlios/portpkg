#!/bin/sh
#make sure mail URLs are handled externally.
#add this line to ~/.mozilla/firefox/*/prefs.js and copy clawsmail.sh to $HOME/.mozilla/clawsmail.sh
##user_pref("network.protocol-handler.app.mailto", "/home/sajmon/.mozilla/clawsmail.sh");
#
/usr/bin/claws-mail --compose "$1"

