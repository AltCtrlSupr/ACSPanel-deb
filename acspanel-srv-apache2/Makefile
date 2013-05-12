include ./CONFIG
PACKAGE_DIR?=${PWD}


all:
	sudo rm -rf control data
	${MAKE} clean
	cp -rfa root/ data
	${MAKE} control
	${MAKE} deb
	${MAKE} incversion

incversion:
	n=$$((`cat MINOR_VERSION`+1));echo $$n > MINOR_VERSION

include ../deb_hand.mak
