GARNAME = iwidgets
GARVERSION = 4.0.1
CATEGORIES = iwidgets
DISTNAME = $(GARNAME)$(GARVERSION)
MASTER_SITES = http://telia.dl.sourceforge.net/sourceforge/incrtcl/
DISTFILES = $(DISTNAME).tar.gz

LIBDEPS = tcl/tcl tcl/itcl

DESCRIPTION = iwidgets
define BLURB
 #FIXME: blurb goes here
endef

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --with-itcl=$(GARDIR)/../../tcl/itcl/work/itcl3.2.1

include ../category.mk

