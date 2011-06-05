GARNAME = tclreadline
GARVERSION = 2.1.0
CATEGORIES = tcl
MASTER_SITES = http://telia.dl.sourceforge.net/sourceforge/tclreadline/
DISTFILES = $(GARNAME)-$(GARVERSION).tar.gz

LIBDEPS = tcl/tcl

DESCRIPTION = tclreadline
define BLURB
 #FIXME: blurb goes here
endef

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS)

include ../category.mk
