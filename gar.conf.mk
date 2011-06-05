#-*- mode: Fundamental; tab-width: 4; -*-
# ex:ts=4
# $Id$

# This file contains configuration variables that are global to
# the GAR system.  Users wishing to make a change on a
# per-package basis should edit the category/package/Makefile, or
# specify environment variables on the make command-line.

# Local cache directories for garball sources
# Do *not* remove the $(FILEDIR) link - just add new ones!
#FILEDIR=
FILE_SITES = file://../../distfiles/

# These are the standard directory name variables from all GNU
# makefiles.  They're also used by autoconf, and can be adapted
# for a variety of build systems.
# 
# TODO: set $(SYSCONFDIR) and $(LOCALSTATEDIR) to never use
# /usr/etc or /usr/var
prefix ?= $(HOME)/bin/tcl8.4.0
BUILD_PREFIX ?= $(prefix)
exec_prefix ?= $(prefix)
bindir ?= $(exec_prefix)/bin
sbindir ?= $(exec_prefix)/sbin
libexecdir ?= $(exec_prefix)/libexec
datadir ?= $(prefix)/share
sysconfdir ?= $(prefix)/etc
sharedstatedir ?= $(prefix)/share
localstatedir ?= $(prefix)/var
libdir ?= $(exec_prefix)/lib
infodir ?= $(BUILD_PREFIX)/info
lispdir ?= $(prefix)/share/emacs/site-lisp
includedir ?= $(BUILD_PREFIX)/include
mandir ?= $(BUILD_PREFIX)/man

# allow us to link to libraries we installed
CPPFLAGS += -I$(includedir)
CFLAGS += -I$(includedir)
LDFLAGS += -L$(libdir)

# allow us to use programs we just built
PATH := $(bindir):$(sbindir):$(BUILD_PREFIX)/bin:$(BUILD_PREFIX)/sbin:$(PATH)
LD_LIBRARY_PATH := $(libdir):$(BUILD_PREFIX)/lib:$(LD_LIBRARY_PATH)

# make these variables available to configure and build scripts
# outside of make's realm.
export prefix exec_prefix bindir sbindir libexecdir datadir sysconfdir
export sharedstatedir localstatedir libdir infodir lispdir includedir mandir 
export CPPFLAGS CFLAGS LDFLAGS PATH LD_LIBRARY_PATH

#MASTER_SITE_OVERRIDE = (overriding mirror)
#PREFIX = /usr
#WRKDIRPREFIX = (in case compilation goes on elsewhere)
#GARDIR = /usr/local/gar
#DISTDIR = (where to try for tarballs and other files before going over the net)
