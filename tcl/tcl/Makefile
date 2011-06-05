GARNAME = tcl
GARVERSION = 8.4.1
CATEGORIES = tcl
DISTNAME = tcl8.4.1
MASTER_SITES = http://telia.dl.sourceforge.net/sourceforge/tcl/
DISTFILES = $(DISTNAME)-src.tar.gz

LIBDEPS = 

DESCRIPTION = tcl
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
