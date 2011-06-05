GARNAME = oratcl
GARVERSION = 40
CATEGORIES = tcl
DISTNAME = oratcl$(GARVERSION)
MASTER_SITES = http://telia.dl.sourceforge.net/sourceforge/oratcl/
DISTFILES = $(DISTNAME).tar.gz
WORKSRC = $(WORKDIR)/oratcl-4-0-branch

LIBDEPS = 

DESCRIPTION = oratcl
define BLURB
 #FIXME: blurb goes here
endef

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS)

include ../category.mk

post-configure:
	sed -e 's/-rpath ${LIB_RUNTIME_DIR}/-Wl,-rpath,${LIB_RUNTIME_DIR}/g' $(WORKSRC)/Makefile > $(WORKSRC)/Makefile.new
	cp -f $(WORKSRC)/Makefile.new $(WORKSRC)/Makefile
