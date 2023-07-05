# dockList

# App Dir
"/System/Applications/Launchpad.app" <br />
"/Applications/Google Chrome.app" <br />
"/Applications/Slack.app" <br />
"/Applications/Google Drive.app" <br />
"/Applications/zoom.us.app" <br />
"/Applications/Microsoft Word.app" <br />
"/System/Applications/System Settings.app" <br />
"/Applications/Safari.app" <br />
"/Applications/Visual Studio Code.app" <br />

# Mosyle command
#!/bin/bash
mkdir /tmp/dock
cd /tmp/dock
curl -l -O /tmp/dock/Docklist.command  "Link_custom_Dock"
chmod +x Docklist.command  
sudo -u $(stat -f "%Su" /dev/console) /bin/sh <<'END'
cp "/tmp/Dock/Docklist.command" "$HOME/Desktop"
rm -rf /tmp/dock