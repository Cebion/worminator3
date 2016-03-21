#!/bin/sh

OPK_NAME=worm3.opk

echo ${OPK_NAME}

# create default.gcw0.desktop
cat > default.gcw0.desktop <<EOF
[Desktop Entry]
Name=Worminator 3
Comment=Platformer
Exec=worminator
Terminal=false
Type=Application
StartupNotify=true
Icon=data/icon
Categories=games;
EOF

# create opk
FLIST="data"
FLIST="${FLIST} default.gcw0.desktop"
FLIST="${FLIST} worminator"
FLIST="${FLIST} license-change.txt"
FLIST="${FLIST} license.txt"
FLIST="${FLIST} ReadMe.txt"
FLIST="${FLIST} allegro.cfg"

rm -f ${OPK_NAME}
mksquashfs ${FLIST} ${OPK_NAME} -all-root -no-xattrs -noappend -no-exports

cat default.gcw0.desktop
rm -f default.gcw0.desktop
