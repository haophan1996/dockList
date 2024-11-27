# dockList
https://github.com/haophan1996/dockList

# App Dir
"/System/Applications/Launchpad.app" <br />
"/Applications/Google Chrome.app" <br />
"/Applications/Slack.app" <br />
"/Applications/Google Drive.app" <br />
"/Applications/zoom.us.app" <br />
"/Applications/Microsoft Excel.app"
"/Applications/Microsoft Word.app" <br />
"/System/Applications/System Settings.app" <br />
"/Applications/Safari.app" <br />
"/Applications/Visual Studio Code.app" <br />

# Mosyle command
#!/bin/bash <br />
mkdir /tmp/dock <br />
cd /tmp/dock <br />
curl -l -O /tmp/dock/Docklist.command  "Link_custom_Dock" <br />
chmod +x Docklist.command <br />
sudo -u $(stat -f "%Su" /dev/console) /bin/sh <<'END' <br />
cp "/tmp/Dock/Docklist.command" "$HOME/Desktop" <br />
rm -rf /tmp/dock <br />



-----

current_ip=$(curl -s https://api64.ipify.org)
target_ip=""

if [ "$current_ip" != "$target_ip" ]; then
    echo "Not at pixel"
    exit 1
fi
