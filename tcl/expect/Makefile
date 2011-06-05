GARNAME = expect
GARVERSION = 5.38
CATEGORIES = tcl
MASTER_SITES = http://expect.nist.gov
DISTFILES = expect.tar.gz

LIBDEPS = tcl/tcl tcl/tk

DESCRIPTION = expect
define BLURB
 #FIXME: blurb goes here
endef

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

#CONFIGURE_ARGS = $(DIRPATHS) --with-itcl=$(GARDIR)/../../tcl/itcl/work/itcl3.2.1

include ../category.mk

CONFIGURE_ARGS = $(DIRPATHS) --with-tclinclude=$(ROOTDIR)/tcl/work/tcl8.4.1/generic --with-tcl=$(ROOTDIR)/tcl/work/tcl8.4.1/unix
