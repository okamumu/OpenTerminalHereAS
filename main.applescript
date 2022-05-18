tell application "Finder"
	set n to properties of Finder window 1
	set p to target of n
	open p using application file "Terminal.app" of folder "Utilities" of folder "Applications" of startup disk
end tell
