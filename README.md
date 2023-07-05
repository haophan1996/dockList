# dockList
App Dir
"/System/Applications/Launchpad.app"
"/Applications/Google Chrome.app"
"/Applications/Slack.app" 
"/Applications/Google Drive.app"
"/Applications/zoom.us.app" 
"/Applications/Microsoft Word.app"
"/System/Applications/System Settings.app"
"/Applications/Safari.app" 
"/Applications/Visual Studio Code.app"
"/Applications/Microsoft Excel.app"

Mosyle 

#!/bin/bash
mkdir /tmp/dock
cd /tmp/dock
curl -l -O /tmp/dock/Docklist.command  "Link_custom_Dock"
chmod +x Docklist.command  
sudo -u $(stat -f "%Su" /dev/console) /bin/sh <<'END'
cp "/tmp/Dock/Docklist.command" "$HOME/Desktop"
rm -rf /tmp/dock