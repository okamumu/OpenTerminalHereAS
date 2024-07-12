tell application "Finder"
	set theWindow to Finder window 1
	set thePath to (POSIX path of (target of theWindow as alias))
end tell

do shell script "open -a Visual\\ Studio\\ Code.app " & quoted form of thePath
