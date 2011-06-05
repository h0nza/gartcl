#-*- mode: Fundamental; tab-width: 4; -*-
# ex:ts=4
# $Id$

# Copyright (C) 2001 Nick Moffitt
# 
# Redistribution and/or use, with or without modification, is
# permitted.  This software is without warranty of any kind.  The
# author(s) shall not be liable in the event that use of the
# software causes damage.


# Comment this out to make much verbosity
#.SILENT:


#ifeq ($(origin GARDIR), undefined)
#GARDIR := $(CURDIR)/../..
#endif

GARDIR ?= ../..
FILEDIR ?= files
DOWNLOADDIR ?= download
COOKIEDIR ?= cookies
WORKDIR ?= work
WORKSRC ?= $(WORKDIR)/$(DISTNAME)
EXTRACTDIR ?= $(WORKDIR)
SCRATCHDIR ?= tmp
CHECKSUM_FILE ?= checksums
MANIFEST_FILE ?= manifest

ROOTDIR ?= $(shell cd ..; pwd; cd -;)

DISTNAME ?= $(GARNAME)-$(GARVERSION)


ALLFILES ?= $(DISTFILES) $(PATCHFILES)

# These are bad, since exporting them mucks up the dep rules!
# WORKSRC is added in manually for the manifest rule.
#export GARDIR FILEDIR DOWNLOADDIR COOKIEDIR WORKDIR WORKSRC EXTRACTDIR
#export SCRATCHDIR CHECKSUM_FILE MANIFEST_FILE

# For rules that do nothing, display what dependencies they
# successfully completed
DONADA = @echo "	[$@] complete.  Finished rules: $+"

# TODO: write a stub rule to print out the name of a rule when it
# *does* do something, and handle indentation intelligently.

# Default sequence for "all" is:  fetch checksum extract patch configure build
all: build
	$(DONADA)


#################### DIRECTORY MAKERS ####################

# This is to make dirs as needed by the base rules
$(sort $(DOWNLOADDIR) $(COOKIEDIR) $(WORKSRC) $(WORKDIR) $(EXTRACTDIR) $(FILEDIR) $(SCRATCHDIR)) $(COOKIEDIR)/%:
	@if test -d $@; then : ; else \
		mkdir -p $@; \
		echo "mkdir $@"; \
	fi

# include the configuration file to override any of these variables
include $(GARDIR)/gar.conf.mk
include $(GARDIR)/gar.lib.mk

# These stubs are wildcarded, so that the port maintainer can
# define something like "pre-configure" and it won't conflict,
# while the configure target can call "pre-configure" safely even
# if the port maintainer hasn't defined it.
# 
# in addition to the pre-<target> rules, the maintainer may wish
# to set a "pre-everything" rule, which runs before the first
# actual target.
pre-%:
	@true

post-%:
	@true

# ========================= MAIN RULES ========================= 
# The main rules are the ones that the user can specify as a
# target on the "make" command-line.  Currently, they are:
#	fetch-list fetch checksum makesum extract checkpatch patch
#	build install reinstall uninstall package
# (some may not be complete yet).
#
# Each of these rules has dependencies that run in the following
# order:
# 	- run the previous main rule in the chain (e.g., install
# 	  depends on build)
#	- run the pre- rule for the target (e.g., configure would
#	  then run pre-configure)
#	- generate a set of files to depend on.  These are typically
#	  cookie files in $(COOKIEDIR), but in the case of fetch are
#	  actual downloaded files in $(DOWNLOADDIR)
# 	- run the post- rule for the target
# 
# The main rules also run the $(DONADA) code, which prints out
# what just happened when all the dependencies are finished.

# fetch-list	- Show list of files that would be retrieved by fetch.
# NOTE: DOES NOT RUN pre-everything!
fetch-list:
	@echo "Distribution files: "
	@for i in $(DISTFILES); do echo "	$$i"; done
	@echo "Patch files: "
	@for i in $(PATCHFILES); do echo "	$$i"; done

# fetch			- Retrieves $(DISTFILES) (and $(PATCHFILES) if defined)
#				  into $(DOWNLOADDIR) as necessary.
fetch: pre-everything $(DOWNLOADDIR) $(addprefix dep-$(GARDIR)/,$(FETCHDEPS)) pre-fetch $(addprefix $(DOWNLOADDIR)/,$(ALLFILES)) post-fetch 
	$(DONADA)

# returns true if fetch has completed successfully, false
# otherwise
fetch-p:
	@$(foreach COOKIEFILE,$(addprefix $(COOKIEDIR)/dep-$(GARDIR)/,$(FETCHDEPS)), test -e $(COOKIEFILE) ;)

# checksum		- Use $(CHECKSUMFILE) to ensure that your
# 				  distfiles are valid.
checksum: fetch $(COOKIEDIR) pre-checksum $(addprefix checksum-,$(filter-out $(NOCHECKSUM),$(ALLFILES))) post-checksum
	$(DONADA)

# returns true if checksum has completed successfully, false
# otherwise
checksum-p:
	@$(foreach COOKIEFILE,$(addprefix $(COOKIEDIR)/checksum-,$(filter-out $(NOCHECKSUM),$(ALLFILES))), test -e $(COOKIEFILE) ;)

# makesum		- Generate distinfo (only do this for your own ports!).
makesum: fetch $(addprefix $(DOWNLOADDIR)/,$(filter-out $(NOCHECKSUM),$(ALLFILES))) 
	@if test "x$(addprefix $(DOWNLOADDIR)/,$(filter-out $(NOCHECKSUM),$(ALLFILES)))" != "x"; then \
		md5sum $(addprefix $(DOWNLOADDIR)/,$(filter-out $(NOCHECKSUM),$(ALLFILES))) > $(CHECKSUM_FILE); \
	fi

# I am always typing this by mistake
makesums: makesum

# extract		- Unpacks $(DISTFILES) into $(EXTRACTDIR) (patches are "zcatted" into the patch program)
extract: checksum $(EXTRACTDIR) $(COOKIEDIR) $(addprefix dep-$(GARDIR)/,$(EXTRACTDEPS)) pre-extract $(addprefix extract-,$(filter-out $(NOEXTRACT),$(DISTFILES))) post-extract
	$(DONADA)

# returns true if extract has completed successfully, false
# otherwise
extract-p:
	@$(foreach COOKIEFILE,$(addprefix $(COOKIEDIR)/extract-,$(filter-out $(NOEXTRACT),$(DISTFILES))), test -e $(COOKIEFILE) ;)

# checkpatch	- Do a "patch -C" instead of a "patch".  Note
# 				  that it may give incorrect results if multiple
# 				  patches deal with the same file.
# TODO: actually write it!
checkpatch: extract
	@echo "$@ NOT IMPLEMENTED YET"

# patch			- Apply any provided patches to the source.
patch: extract $(WORKSRC) pre-patch $(addprefix patch-,$(PATCHFILES)) post-patch
	$(DONADA)

# returns true if patch has completed successfully, false
# otherwise
patch-p:
	@$(foreach COOKIEFILE,$(addprefix $(COOKIEDIR)/patch-,$(PATCHFILES)), test -e $(COOKIEFILE) ;)

# makepatch		- Grab the upstream source and diff against $(WORKSRC).  Since
# 				  diff returns 1 if there are differences, we remove the patch
# 				  file on "success".  Goofy diff.
makepatch: $(SCRATCHDIR) $(FILEDIR) $(FILEDIR)/gar-base.diff
	$(DONADA)

# this takes the changes you've made to a working directory,
# distills them to a patch, updates the checksum file, and tries
# out the build (assuming you've listed the gar-base.diff in your
# PATCHFILES).  This is way undocumented.  -NickM
beaujolais: makepatch makesum clean build
	$(DONADA)

# configure		- Runs either GNU configure, one or more local
# 				  configure scripts or nothing, depending on
# 				  what's available.
configure: patch $(addprefix builddep-$(GARDIR)/,$(BUILDDEPS)) $(addprefix dep-$(GARDIR)/,$(LIBDEPS)) pre-configure $(addprefix configure-,$(CONFIGURE_SCRIPTS)) post-configure
	$(DONADA)

# returns true if configure has completed successfully, false
# otherwise
configure-p:
	@$(foreach COOKIEFILE,$(addprefix $(COOKIEDIR)/configure-,$(CONFIGURE_SCRIPTS)), test -e $(COOKIEFILE) ;)

# build			- Actually compile the sources.
build: configure pre-build $(addprefix build-,$(BUILD_SCRIPTS)) post-build
	$(DONADA)

# returns true if build has completed successfully, false
# otherwise
build-p:
	@$(foreach COOKIEFILE,$(addprefix $(COOKIEDIR)/build-,$(BUILD_SCRIPTS)), test -e $(COOKIEFILE) ;)

# strip			- Strip binaries
strip: build pre-strip $(addprefix strip-,$(STRIP_SCRIPTS)) post-strip
	@echo "$@ NOT IMPLEMENTED YET"

# install		- Install the results of a build.
install: build $(addprefix dep-$(GARDIR)/,$(INSTALLDEPS)) pre-install $(addprefix install-,$(INSTALL_SCRIPTS)) post-install
	$(DONADA)

# returns true if install has completed successfully, false
# otherwise
install-p:
	@$(foreach COOKIEFILE,$(addprefix $(COOKIEDIR)/install-,$(INSTALL_SCRIPTS)), test -e $(COOKIEFILE) ;)

# installstrip		- Install the results of a build, stripping first.
installstrip: strip pre-install $(addprefix install-,$(INSTALL_SCRIPTS)) post-install
	$(DONADA)

# reinstall		- Install the results of a build, ignoring
# 				  "already installed" flag.
# TODO: actually write it!
reinstall: build
	@echo "$@ NOT IMPLEMENTED YET"
	
# uninstall		- Remove the installation.
# TODO: actually write it!
uninstall: build
	@echo "$@ NOT IMPLEMENTED YET"
	

# package		- Create a package from an _installed_ port.
# TODO: actually write it!
package: build
	@echo "$@ NOT IMPLEMENTED YET"

# The clean rule.  It must be run if you want to re-download a
# file after a successful checksum (or just remove the checksum
# cookie, but that would be lame and unportable).
clean:
	@rm -rf $(DOWNLOADDIR) $(COOKIEDIR) $(WORKSRC) $(WORKDIR) $(EXTRACTDIR) $(SCRATCHDIR) $(SCRATCHDIR)-$(COOKIEDIR) *~

# these targets do not have actual corresponding files
.PHONY: all fetch-list fetch checksum makesum extract checkpatch patch makepatch configure build install clean beaujolais strip

.NOTPARALLEL:
