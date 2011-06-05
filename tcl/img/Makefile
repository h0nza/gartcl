GARNAME = img
GARVERSION = 1.2.4
CATEGORIES = tcl
MASTER_SITES = http://www.neosoft.com/tcl/ftparchive/sorted/packages-8.0/graphics/Img/1.2/
DISTNAME = $(GARNAME)$(GARVERSION)
DISTFILES = $(DISTNAME).tar.gz

LIBDEPS = tcl/tk

DESCRIPTION = img
define BLURB
 #FIXME: blurb goes here
endef

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS)

include ../category.mk
