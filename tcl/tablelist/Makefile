GARNAME = tablelist
GARVERSION = 3.2
CATEGORIES = tcl
MASTER_SITES = http://home.t-online.de/home/csaba.nemethi/tablelist/
DISTNAME = $(GARNAME)$(GARVERSION)
DISTFILES = $(GARNAME)$(GARVERSION).tar.gz

LIBDEPS = tcl/tk

DESCRIPTION = tablelist
define BLURB
 #FIXME: blurb goes here
endef

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS = 
INSTALL_SCRIPTS = custom 

include ../../gar.mk

install-custom:
	cp -r $(WORKSRC)/ $(prefix)/lib
	$(MAKECOOKIE)

