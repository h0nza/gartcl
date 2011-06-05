GARNAME = tcllib
GARVERSION = 1.3
CATEGORIES = tcl
MASTER_SITES = http://telia.dl.sourceforge.net/sourceforge/tcllib/
DISTFILES = $(DISTNAME).tar.gz

LIBDEPS = tcl/tcl

DESCRIPTION = tcllib
define BLURB
 #FIXME: blurb goes here
endef

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) 

include ../category.mk
