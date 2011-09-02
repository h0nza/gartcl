GARDIR = ../../GAR

GARNAME = pkgconfig
CATEGORIES = tools devel
GARVERSION = 0.15.0
pkgconfig_VERSION = 0.15.0

#od 0.18.1 prejmenovano:
GARNAME = pkg-config
GARVERSION = 0.21
#od 0.23 podpora PKG_CONFIG_SYSROOT_DIR !!! a Require.private (rekurze -static)
GARVERSION = 0.23

pkg-config_VERSION ?= 0.26
pkg-config_VERSION ?= 0.25
pkg-config_VERSION ?= 0.23
GARVERSION = $($(GARNAME)_VERSION)

# MASTER_SITES = http://prdownloads.sourceforge.net/libpng/

DISTFILES = $(DISTNAME).tar.gz

MAINTAINER = Jan Vlcek <jan.vlcek@i.cz>

# GPL, LGPL or MPL
LICENSE = gpl
gpl_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = $(GARNAME)
define BLURB
$(DESCRIPTION)
SunOS 5.8 kanec: 0.21 potrebuje GCC
endef

#honza: neni zadne .configure a knihovna se dela static
CONFIGURE_SCRIPTS = $(WORKSRC)/configure
CONFIGURE_ARGS = \
 --disable-shared \
 --prefix=$(prefix)

BUILD_SCRIPTS = $(WORKSRC)/Makefile
BUILD_ARGS =

INSTALL_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_OVERRIDE_DIRS =
INSTALL_OVERRIDE_DIRS = prefix exec_prefix libdir includedir


include ../../gar.mk

#MASTER_SITES  = ftp://fr2.rpmfind.net/linux/gnome.org/sources/$(GARNAME)/0.15/
#MASTER_SITES += ftp://ftp.gnome.org/pub/GNOME/sources/$(GARNAME)/0.15/
 MASTER_SITES += http://pkgconfig.freedesktop.org/releases/

test : build
	cd $(WORKSRC) && $(MAKE) check
