GARNAME = tls
GARVERSION = 1.4.1
CATEGORIES = tcl
DISTNAME = tls$(GARVERSION)
MASTER_SITES = http://telia.dl.sourceforge.net/sourceforge/tls/
DISTFILES = $(DISTNAME)-src.tar.gz
WORKSRC = $(WORKDIR)/tls1.4

LIBDEPS = 

DESCRIPTION = tls
define BLURB
 #FIXME: blurb goes here
endef

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = --with-ssl-dir=/usr $(DIRPATHS)

include ../category.mk

CONFIGURE_ARGS = $(DIRPATHS) --with-ssl-dir=/usr --with-tclinclude=$(ROOTDIR)/tcl/work/tcl8.4.3/generic --with-tcl=$(ROOTDIR)/tcl/work/tcl8.4.3/unix
