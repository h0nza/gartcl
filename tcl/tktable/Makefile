GARNAME = Tktable
GARVERSION = 2.7
CATEGORIES = tcl
MASTER_SITES = http://telia.dl.sourceforge.net/sourceforge/tktable/
DISTNAME = $(GARNAME)$(GARVERSION)
DISTFILES = $(DISTNAME).tar.gz

LIBDEPS = tcl/tk

DESCRIPTION = Tktable
define BLURB
 #FIXME: blurb goes here
endef

CONFIGURE_SCRIPTS = $(WORKSRC)/unix/configure
BUILD_SCRIPTS = $(WORKSRC)/unix/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/unix/Makefile

CONFIGURE_ARGS = $(DIRPATHS)

include ../category.mk
