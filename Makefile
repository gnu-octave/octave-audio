sinclude ../../Makeconf
sinclude ../../pkg.mk

PKG_FILES = $(patsubst %,audio/%, COPYING DESCRIPTION INDEX \
	$(wildcard doc/*) $(wildcard inst/*) $(wildcard src/*))
