# OpenTerminalHereAS

An application to open the current folder with terminal.
This is a hommage of OpenTerminalHere.

## Usage

- Open main.applescript with `Script Editor`
- Make an application by `export...`
- Move the application file to Application folder
- Put the shortcut on the toolber of Finder window
- Click the icon of the application

## Applescript

The main script is as follows.

```applescript
tell application "Finder"
	set n to properties of Finder window 1
	set p to target of n
	open p using application file "Terminal.app" of folder "Utilities" of folder "Applications" of startup disk
end tell
```

If you launch other applications, it may be possible to change the following part to the path of application you want.
```
open p using application file "Terminal.app" of folder "Utilities" of folder "Applications" of startup disk
```

