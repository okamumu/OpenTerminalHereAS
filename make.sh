#!/bin/bash

SCRIPT1_FILE="terminal2.applescript"
SCRIPT2_FILE="vscode2.applescript"

APP1_NAME="OpenTerminalHere"
APP2_NAME="OpenVSCodeHere"

ICON1_FILE="Terminal.icns"
ICON2_FILE="Code.icns"

APP1="$APP1_NAME.app"
APP2="$APP2_NAME.app"

APPLICATIONS_DIR="/Applications"

osacompile -o $APP1 $SCRIPT1_FILE
osacompile -o $APP2 $SCRIPT2_FILE

cp $ICON1_FILE $APP1/Contents/Resources/applet.icns
touch $APP1

cp $ICON2_FILE $APP2/Contents/Resources/applet.icns
touch $APP2
