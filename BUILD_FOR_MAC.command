cd "`dirname "$0"`"

# Uses: https://github.com/electron-userland/electron-packager
# To install it globally:
#
#     npm install electron-packager -g
#

# Clean
rm -rf Inky-darwin-x64/

# Ensure it's correctly/fully installed first
( cd app && npm install )

# Create icon from PNG
./resources/makeIcns.command

# Mac
electron-packager app Inky --platform=darwin  --arch=x64 --icon=resources/Icon.icns --extend-info=resources/info.plist --prune --asar --asar-unpack-dir="main-process/ink" --ignore="inklecate_win.exe"

# Remove .icns again
rm resources/Icon.icns
