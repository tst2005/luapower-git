# compress all windows binaries
# TIP: get upx from http://upx.sourceforge.net/download/upx309w.zip

upx="$(cd ..; pwd)/upx.exe"
cd ../lua-files/bin/mingw32
"$upx" -q *.dll *.exe lanes/*.dll
