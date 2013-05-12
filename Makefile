DIST=stable

all:
	${MAKE} mrproper
	#for a in debs/*.deb debs/perl/*.deb ; do
	for a in */*.deb ; do \
		${MAKE} add PKG=$$a ; \
	done 
	${MAKE} copy

copy sync:
	cp dists/squeeze/main/binary-i386/Packages.gz .

update:
	reprepro -b . update

ifneq (${PKG},)
add:
	reprepro -Vb . --ignore=forbiddenchar includedeb ${DIST} ${PKG}
else
add:
	@echo No PKG defined
endif

ifneq (${PKG},)
del:
	reprepro -Vb . remove ${DIST} ${PKG}
else
del:
	@echo No PKG defined
endif

mrproper:
	rm -rf db dists lists pool
	rm -f CydiaIcon.png Packages*
