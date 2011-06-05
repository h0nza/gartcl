
CONFIGURE_ARGS += --with-tclinclude=$(prefix)/include --with-tcl=$(prefix)/lib \
		  --with-tkinclude=$(prefix)/include --with-tk=$(prefix)/lib

MASTER_SITES = http://phpsource.net/gartcl/dist/

include ../../gar.mk
