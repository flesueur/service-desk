#!/bin/bash

rpmmacros=~/.rpmmacros

VERSION=0.5.beta

if [[ ! -e $rpmmacros ]]
then
    echo "[ERROR] Missing $rpmmacros" >&2
    echo "See README" >&2
    exit 1
fi

topdir=$(grep '%_topdir' ~/.rpmmacros | awk '{ print $2; }')

if [[ -z $topdir ]]
then
    echo "[ERROR] expected %_topdir in $rpmmacros missing" >&2
    exit 1
fi

if [[ ! -d $topdir ]]
then
    echo "[ERROR] expected topdir $topdir to exist" >&2
    exit 1
fi


# Copy packaging files from current directory to build directory:
cp -Ra rpm/* "$topdir"

# Copy Self Service Archive to SOURCES/:
cp ltb-project-service-desk-${VERSION}.tar.gz "$topdir"/SOURCES

# Go in build directory and build package:
cd "$topdir"
rpmbuild -ba SPECS/service-desk.spec

# Sign RPM:
rpm --addsign RPMS/noarch/service-desk*
