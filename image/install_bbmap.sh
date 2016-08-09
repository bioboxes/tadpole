#!/bin/bash

set -o errexit
set -o nounset
set -o xtrace

BUILD="wget ca-certificates"
ESSENTIAL="openjdk-7-jre-headless"

# Require dependencies
apt-get update --yes
apt-get install --yes --no-install-recommends ${BUILD} ${ESSENTIAL}

# Install bbmap
URL="http://downloads.sourceforge.net/project/bbmap/BBMap_36.20.tar.gz"
wget ${URL} --quiet --output-document - \
  | tar xzf - --directory /usr/local/
ln -s /usr/local/bbmap/tadpole.sh /usr/local/bin

# Clean up dependencies
apt-get autoremove --purge --yes ${BUILD}
apt-get -q clean
rm -rf /var/lib/apt/lists/*
