#!/bin/sh
# MAINTAINER: T. Pfaff 'tom' <topf@users.berlios.de>
# SOURCES: http://dl.sourceforge.net/gtk-server/gtk-server-2.0.12.tar.gz
# MD5SUMS: 3d8697d07c256be3629701f15ca91dbe gtk-server-2.0.12.tar.gz
# REQUIRES: gtk+2 libffi libglade
# UP2DATE: http://heanet.dl.sourceforge.net/sourceforge/gtk-server

TMP=${TMP:-/tmp}
CWD=`pwd`
NAME=`basename $CWD`
PKG=$TMP/package-$NAME

VERSION=2.0.12
ARCH=${ARCH:-i486}
BUILD=1tom

if [ "$ARCH" = "i386" ]; then
  SLKCFLAGS="-O2 -march=i386 -mcpu=i686"
elif [ "$ARCH" = "i486" ]; then
  SLKCFLAGS="-O2 -march=i486 -mcpu=i686"
elif [ "$ARCH" = "s390" ]; then
  SLKCFLAGS="-O2"
elif [ "$ARCH" = "x86_64" ]; then
  SLKCFLAGS="-O2"
fi

rm -rf $PKG
mkdir -p $PKG/usr
cd $TMP
tar xzvf $CWD/gtk-server-$VERSION.tar.gz
cd gtk-server-$VERSION
chown -R root.root .
CFLAGS="$SLKCFLAGS" \
./configure #\
#  --prefix=/usr \
#  --sysconfdir=/etc \
#  --localstatedir=/var/lib \
#  --program-prefix="" \
#  --disable-static \
#  --enable-glade \
#  --with-gtk2 \
#  --enable-library \
#  $ARCH-slackware-linux
#sed -i "s,/usr/local/etc,$PKG/etc/," Makefile
#sed -i "s,/usr/local/,$PKG/usr/," Makefile
mkdir -p $PKG/etc $PKG/usr/bin
make
make install SYSCONFIG=$PKG/etc prefix=$PKG/usr
find $PKG/ -name perllocal.pod | xargs -r rm -fv
rm -fv $PKG/usr/info/dir
( cd $PKG
  find . | xargs file | grep "executable" | grep ELF | cut -d : -f 1 | xargs -r strip --strip-unneeded
  find . | xargs file | grep "shared object" | grep ELF | cut -d : -f 1 | xargs -r strip --strip-unneeded
  find . | xargs file | grep "current ar archive" | cut -f 1 -d : | xargs -r strip --strip-debug
)
mv $PKG/usr/share/{man,doc} $PKG/usr/ || true
mkdir -p $PKG/usr/doc/$NAME-$VERSION
cp -a \
  CREDITS README \
  $PKG/usr/doc/$NAME-$VERSION/
find $PKG/usr/doc -type f | xargs -r chmod 644
find $PKG/usr/doc -type d | xargs -r chmod 755
find $PKG/usr/{man,info} -type f | xargs -r gzip -9
mkdir -p $PKG/install
cat $CWD/slack-desc >$PKG/install/slack-desc

cd $PKG
makepkg -p -l y -c n $TMP/$NAME-$VERSION-$ARCH-$BUILD.tgz

if [ "$1" = "--cleanup" ]; then
  rm -rf $TMP/gtk-server-$VERSION
  rm -rf $PKG
fi
