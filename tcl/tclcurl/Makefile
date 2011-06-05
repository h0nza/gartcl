GARNAME = TclCurl
GARVERSION = 0.9.8
CATEGORIES = tcl
MASTER_SITES = http://personal1.iddeo.es/andresgarci/tclcurl/download/tarball/
DISTFILES = $(GARNAME)-$(GARVERSION).tar.gz

LIBDEPS = tcl/tcl

DESCRIPTION = TclCurl
define BLURB
 #FIXME: blurb goes here
endef

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS)

include ../category.mk
