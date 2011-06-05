GARNAME = tDOM
GARVERSION = 0.7.5
CATEGORIES = tcl
MASTER_SITES = http://sdf.lonestar.org/~loewerj/tdom.cgi?/
MASTER_SITES = http://loewerj.freeshell.org/dd/
MASTER_SITES = http://tdom.org/
DISTFILES = $(DISTNAME).tar.gz

# http://loewerj.freeshell.org/tdom.cgi?tDOM-0.7.4.tar.gz

LIBDEPS = tcl/tcl

DESCRIPTION = tDOM
define BLURB
 #FIXME: blurb goes here
endef

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS = $(WORKSRC)/unix/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/unix/Makefile

CONFIGURE_ARGS = $(DIRPATHS) 
CONFIGURE_ARGS += --disable-threads --with-tclinclude=${prefix}/include --with-tcl=${prefix}/lib

include ../../gar.mk

configure-custom:
	cd $(WORKSRC)/unix && $(CONFIGURE_ENV) ../configure $(CONFIGURE_ARGS)
	$(MAKECOOKIE)

