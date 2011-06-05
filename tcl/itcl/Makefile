GARNAME = itcl
GARVERSION = 3.2.1
CATEGORIES = itcl
DISTNAME = $(GARNAME)$(GARVERSION)
MASTER_SITES = http://telia.dl.sourceforge.net/sourceforge/incrtcl/
DISTFILES = $(DISTNAME)_src.tgz

LIBDEPS = tcl/tcl

DESCRIPTION = itcl
define BLURB
 #FIXME: blurb goes here
endef

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS)

include ../category.mk

