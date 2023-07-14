#!/bin/bash  
app_paths=(
	"/System/Applications/Launchpad.app"
   	"/Applications/Google Chrome.app"
   	"/Applications/Slack.app" 
    "/Applications/Google Drive.app"
	"/Applications/zoom.us.app" 
	"/System/Applications/System Settings.app"
) 
dock_plist="$HOME/Library/Preferences/com.apple.dock.plist"   
map_is_in_dock() { 
    maps_bundle_identifier="com.apple.Maps"
    defaults read "$dock_plist" persistent-apps | grep -q "$maps_bundle_identifier"
}
check_dock_being_crazy() {
    if map_is_in_dock; then
        echo "Crazy Dock"
        killall Dock
        Sleep 5
        defaults write "$dock_plist" persistent-apps -array
        killall Dock
        sleep 5
    else
        sleep 2
        defaults write "$dock_plist" persistent-apps -array 
        killall Dock
        sleep 5
        echo "Dock is good now"
    fi
}
echo "Show recent applications in Dock disabled."
defaults write "$dock_plist" show-recents -bool false 
echo "Remove all apps from the Dock"
check_dock_being_crazy  
echo "All apps successfully removed from the Dock."
echo "_____________Adding apps to dock____________________"
app_is_in_dock() {
    local app_path=$1
    defaults read "$dock_plist" persistent-apps | grep -q "$app_path"
}
add_app_to_dock() {
    local app_path=$1
    defaults write "$dock_plist" persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$app_path</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
}
for app_path in "${app_paths[@]}"; do
    if app_is_in_dock "$app_path"; then
        echo "App at path $app_path is already in the Dock."
    else
        add_app_to_dock "$app_path"
        echo "App at path $app_path successfully added to the Dock."
    fi
done 
killall Dock 
echo "Done"

echo "Done"
osascript -e 'tell application "Terminal" to quit' -y
killall Terminal
