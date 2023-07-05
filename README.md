# dockList


Mosyle 

#!/bin/bash
mkdir /tmp/dock
cd /tmp/dock
curl -l -O /tmp/dock/Docklist.command  "Link_custom_Dock"
chmod +x Docklist.command  
sudo -u $(stat -f "%Su" /dev/console) /bin/sh <<'END'
cp "/tmp/Dock/Docklist.command" "$HOME/Desktop"
rm -rf /tmp/dock