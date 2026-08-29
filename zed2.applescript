tell application "Finder"
    set theWindow to Finder window 1
    set thePath to POSIX path of (target of theWindow as alias)
end tell

do shell script "zsh -lc " & quoted form of ("cd " & quoted form of thePath & " && zed -n .")
