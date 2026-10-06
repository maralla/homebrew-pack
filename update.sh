#!/usr/bin/env bash

set -ex

VERSION=$1

ARTIFACT_DIR="./artifacts"
MAC_X86="${ARTIFACT_DIR}/pack-${VERSION}-x86_64-apple-darwin.tar.gz"
MAC_AARCH64="${ARTIFACT_DIR}/pack-${VERSION}-aarch64-apple-darwin.tar.gz"
LINUX_X86="${ARTIFACT_DIR}/pack-${VERSION}-x86_64-unknown-linux-gnu.tar.gz"
LINUX_AARCH64="${ARTIFACT_DIR}/pack-${VERSION}-aarch64-unknown-linux-musl.tar.gz"

REPO="git@github.com:maralla/homebrew-pack.git"
BREW_FILE="Formula/pack.rb"

# Calculate checksums
mac_x86_checksum=$(sha256sum "$MAC_X86" | cut -f1 -d' ')
mac_aarch64_checksum=$(sha256sum "$MAC_AARCH64" | cut -f1 -d' ')
linux_x86_checksum=$(sha256sum "$LINUX_X86" | cut -f1 -d' ')
linux_aarch64_checksum=$(sha256sum "$LINUX_AARCH64" | cut -f1 -d' ')

# Substitute version and checksums
sed -i -b'' "s/\(version \)'[^']*'/\1'$VERSION'/" "$BREW_FILE"
sed -i -b'' "s/\(sha256 \"\)[^\"]*\(\" # mac-x86\)/\1$mac_x86_checksum\2/" "$BREW_FILE"
sed -i -b'' "s/\(sha256 \"\)[^\"]*\(\" # mac-aarch64\)/\1$mac_aarch64_checksum\2/" "$BREW_FILE"
sed -i -b'' "s/\(sha256 \"\)[^\"]*\(\" # linux-x86\)/\1$linux_x86_checksum\2/" "$BREW_FILE"
sed -i -b'' "s/\(sha256 \"\)[^\"]*\(\" # linux-aarch64\)/\1$linux_aarch64_checksum\2/" "$BREW_FILE"

git config --local user.email "actions@github.com"
git config --local user.name "GitHub Actions"
git add "$BREW_FILE"
git commit -m "Update version of pack for homebrew to $VERSION"

git push "$REPO" HEAD:refs/heads/master
