#!/usr/bin/env bash

set -ex

VERSION=$1
MAC=./macos-latest/pack-$VERSION-x86_64-apple-darwin.tar.gz
LINUX=./ubuntu-latest/pack-$VERSION-x86_64-unknown-linux-gnu.tar.gz
REPO=https://$GITHUB_ACTOR:$GITHUB_TOKEN@github.com/maralla/homebrew-pack.git

BREW_FILE=Formula/pack.rb

mac_checksum=$(shasum -a 256 $MAC | cut -f1 -d' ')
linux_checksum=$(shasum -a 256 $LINUX | cut -f1 -d' ')

# Substitude version
sed -i -b'' "s/\(version \)'[^']*'/\1'$VERSION'/" $BREW_FILE

# Substitude checksum
sed -i -b'' "s/\(sha256 \"\)[^\"]*\(\" # mac\)/\1$mac_checksum\2/" $BREW_FILE
sed -i -b'' "s/\(sha256 \"\)[^\"]*\(\" # linux\)/\1$linux_checksum\2/" $BREW_FILE

git config --local user.email "actions@github.com"
git config --local user.name "Github Actions"
git add $BREW_FILE
git commit -m "Update version of pack for homebrew to $VERSION"
git push $REPO HEAD:refs/heads/master
