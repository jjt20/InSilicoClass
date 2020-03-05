#!/bin/bash

function install_coursier() {
	BIN=coursier
	PREFIX=~/.local/bin
	DL_URL="https://git.io/coursier-cli"
	mkdir -p $PREFIX || return 1
	echo "Downloading ($DL_URL -> $PREFIX/$BIN)... "
	wget -q $DL_URL -O $PREFIX/$BIN || return 1
	echo "Chmod'ing..."
	chmod 755 $PREFIX/$BIN || return 1
	echo "Done."
	return 0
}
