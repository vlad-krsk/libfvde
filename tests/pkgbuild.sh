#!/bin/sh
# Script to build a MacOS pkg
#
# Version: 20201121

set -e

make install DESTDIR=${PWD}/osx-pkg
mkdir -p ${PWD}/osx-pkg/usr/share/doc/libfvde
cp AUTHORS COPYING COPYING.LESSER NEWS README ${PWD}/osx-pkg/usr/share/doc/libfvde

VERSION=`sed '5!d; s/^ \[//;s/\],$//' configure.ac`
pkgbuild --root osx-pkg --identifier com.github.libyal.libfvde --version ${VERSION} --ownership recommended ../libfvde-${VERSION}.pkg

