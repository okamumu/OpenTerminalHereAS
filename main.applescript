tell application "Finder"
	set theWindow to properties of Finder window 1
	set thePath to target of theWindow
	open thePath using application file "Terminal.app" of folder "Utilities" of folder "Applications" of startup disk
end tell
