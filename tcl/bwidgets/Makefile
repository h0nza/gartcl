GARNAME = BWidget
GARVERSION = 1.4.1
CATEGORIES = tcl
DISTFILES = $(DISTNAME).tar.gz

LIBDEPS = tcl/tcl tcl/tk

DESCRIPTION = tk
define BLURB
 #FIXME: blurb goes here
endef

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) 

include ../category.mk

pre-configure:
	(cd $(WORKSRC); mkdir config; automake -a; autoconf)
