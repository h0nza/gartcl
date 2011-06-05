GARNAME = snack
GARVERSION = 2.2
CATEGORIES = tcl
MASTER_SITES = http://www.speech.kth.se/~kare/
DISTNAME = $(GARNAME)$(GARVERSION)
DISTFILES = $(DISTNAME).tar.gz

LIBDEPS = 

DESCRIPTION = snack
define BLURB
 #FIXME: blurb goes here
endef

CONFIGURE_SCRIPTS = $(WORKSRC)/unix/configure
BUILD_SCRIPTS = $(WORKSRC)/unix/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/unix/Makefile

CONFIGURE_ARGS = $(DIRPATHS)

include ../category.mk

post-install:
	(cd ${prefix}/bin; ln -sf tclsh8.4 tclsh)
