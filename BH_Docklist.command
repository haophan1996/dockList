#!/bin/bash 


# Specify the paths to the apps you want to add to the Dock
app_paths=(
	"/System/Applications/Launchpad.app"
   	"/Applications/Google Chrome.app"
   	"/Applications/Slack.app"
    #"/Applications/Microsoft Word.app"
   	#"/Applications/Safari.app" 
    "/Applications/Visual Studio Code.app"
    #"/Applications/Microsoft Excel.app"
	 #"/Applications/Google Drive.app"
	"/Applications/zoom.us.app" 
	"/System/Applications/System Settings.app"
) 
dock_plist="$HOME/Library/Preferences/com.apple.dock.plist"  
# Function to check if Safari is in the persistent-apps array
map_is_in_dock() {
    # Check random app, to see if default dock is appear
    maps_bundle_identifier="com.apple.Maps"
    defaults read "$dock_plist" persistent-apps | grep -q "$maps_bundle_identifier"
}
check_dock_being_crazy() {  
    # Check if Safari is in the Dock
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
 
echo "
Show recent applications in Dock disabled."
defaults write "$dock_plist" show-recents -bool false 
 
echo "
Remove all apps from the Dock"
check_dock_being_crazy  

echo "
All apps successfully removed from the Dock."
 
echo "_____________Adding apps to dock____________________"

# Function to check if an app is already in the Dock
app_is_in_dock() {
    local app_path=$1
    defaults read "$dock_plist" persistent-apps | grep -q "$app_path"
}

# Function to add an app to the Dock - DO NOT REMOVE THIS
add_app_to_dock() {
    local app_path=$1
    defaults write "$dock_plist" persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$app_path</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
}

# Loop through the app paths and add them to the Dock if they are not already there
for app_path in "${app_paths[@]}"; do
    if app_is_in_dock "$app_path"; then
        echo "App at path $app_path is already in the Dock."
    else
        add_app_to_dock "$app_path"
        echo "App at path $app_path successfully added to the Dock."
    fi
done

# Restart the Dock to apply the changes
killall Dock

echo "Done"
