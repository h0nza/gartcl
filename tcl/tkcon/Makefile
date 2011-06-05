GARNAME = tkcon
GARVERSION = 2.3
CATEGORIES = tcl
MASTER_SITES = http://telia.dl.sourceforge.net/sourceforge/tkcon/
DISTFILES = $(GARNAME)-$(GARVERSION).tar.gz

LIBDEPS = tcl/tcl

DESCRIPTION = tkcon
define BLURB
 #FIXME: blurb goes here
endef

CONFIGURE_SCRIPTS = none
BUILD_SCRIPTS = none
INSTALL_SCRIPTS = none

CONFIGURE_ARGS = $(DIRPATHS)

include ../category.mk

configure-none:
build-none:

install-none:
	(cp $(WORKSRC)/tkcon.tcl $(prefix)/bin/tkcon)
