#!/bin/sh

set -e

if test "$#" != 1; then
  echo "Usage: $0 PACKAGE"
  exit 1
fi

pkg=$1
shift

last_version=$(opam show -f version "$pkg" | cut -d~ -f1)
target=$pkg/$pkg.${last_version}~alpha-repo

mkdir -p "$target"
opam show --raw "$pkg" > "$target/opam"
