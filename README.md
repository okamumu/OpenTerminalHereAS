# OpenTerminalHereAS

An application to open the current folder with Terminal.  
This is a hommage to the original OpenTerminalHere.

## Demo

![Image](https://github.com/user-attachments/assets/850407b7-86e3-40e8-ae59-6ab744adf976)

## Install

### 1. Build the applications

Run the following command in your terminal:

```sh
sh make.sh
```

### 2\. Move the generated .app files to the Applications folder

After building, you will get:

  * `OpenTerminalHere.app`
  * `OpenVSCodeHere.app` (if included)
  * `OpenZedHere.app` (if included)

Move them to `/Applications` or `~/Applications`.

### 3\. (Optional) Set a custom icon

If you want to use your own icon (`.icns`):

1.  Select the application in Finder.
2.  Press **Cmd + I** to open "Get Info".
3.  Drag and drop your `.icns` file onto the **small icon in the top-left corner** of the info window.
4.  Enter your password if prompted.

> **Note:** This is the most reliable way to set icons on macOS.

### 4\. Put the application in the Finder toolbar

Drag the `.app` file to the Finder toolbar while holding **Command (⌘)**.

### 5\. Use it

Click the icon on the Finder toolbar to open the current folder in Terminal, VS Code, or Zed.

## Prerequisites

### For OpenVSCodeHere.app

To use `OpenVSCodeHere.app`, you need to enable the `code` command in your terminal:

1. Open VS Code
2. Press **Cmd + Shift + P** to open the Command Palette
3. Type "shell command" and select **"Shell Command: Install 'code' command in PATH"**

After this setup, the `code` command will be available in your terminal, and `OpenVSCodeHere.app` will work correctly.

### For OpenZedHere.app

To use `OpenZedHere.app`, you need to enable the `zed` command in your terminal:

1. Open Zed
2. Choose **Zed > Install CLI** from the menu bar (or press **Cmd + Shift + P** and type "install cli")
3. Enter your password if prompted

After this setup, the `zed` command will be available in your terminal, and `OpenZedHere.app` will work correctly.

