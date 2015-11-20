#!/bin/bash

# osx
electron-builder build/darwin/x64/Rodeo-darwin-x64/Rodeo.app --platform=osx \
        --out=./build/darwin/x64/Rodeo-darwin-x64/ --config=packager.json

ditto -ck --rsrc --sequesterRsrc --keepParent build/darwin/x64/Rodeo-darwin-x64/Rodeo.app \
  build/darwin/x64/Rodeo-darwin-x64/Rodeo.zip

# windows
#   32 bit
electron-builder build/win32/all/Rodeo-win32-ia32 --platform=win \
        --out=./build/win32/all//Rodeo-win32-ia32 --config=packager.json

ditto -ck --rsrc --sequesterRsrc --keepParent build/win32/all/Rodeo-win32-ia32 \
  build/win32/all/Rodeo-win32-ia32.zip

#   64 bit
electron-builder build/win32/all/Rodeo-win32-x64 --platform=win \
        --out=./build/win32/all/Rodeo-win32-x64 --config=packager.json

ditto -ck --rsrc --sequesterRsrc --keepParent build/win32/all/Rodeo-win32-x64 \
  build/win32/all/Rodeo-win32-x64.zip

# linux
if [ -d ./build/linux/x64/Rodeo-linux-x64/ ]; then
  tar -zcvf ./build/linux/x64/Rodeo-linux-x64.tar.gz ./build/linux/x64/Rodeo-linux-x64/
fi

# if [ "$1"!="" ]; then
# 
#   echo "Release name? "
#   read NAME
#   echo "Release tag? "
#   read TAG
#   echo "Uploading release to GitHub:"
#   echo "  NAME: ${NAME}"
#   echo "  TAG: ${TAG}"
#   github-release release -u yhat -r rodeo-native -n "${NAME}" -d "${NAME}" --tag ${TAG}
#   github-release upload -u yhat -r rodeo-native --tag ${TAG} --name "Rodeo-mac.dmg" --file build/darwin/x64/Rodeo-darwin-x64/Rodeo.dmg
#   github-release upload -u yhat -r rodeo-native --tag ${TAG} --name "RodeoSetup-ia32.exe" --file build/win32/all/Rodeo-win32-ia32/Rodeo\ Setup.exe
#   github-release upload -u yhat -r rodeo-native --tag ${TAG} --name "RodeoSetup-x64.exe" --file build/win32/all/Rodeo-win32-x64/Rodeo\ Setup.exe
# 
# fi
