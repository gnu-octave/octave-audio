sinclude Makeconf

all:
ifdef HAVE_LINUX_SOUNDCARD
	$(MAKE) -f Makefile.linux
endif # HAVE_LINUX_SOUNDCARD is not defined
ifeq (apple-darwin,$(findstring apple-darwin,$(canonical_host_type)))
	$(MAKE) -f Makefile.macosx
endif # ifeq (apple-darwin)

clean:
	@echo "Cleaning..."; \
	$(RM) -rf *.o core octave-core ../bin/* *~ *.oct

distclean realclean: clean
	@echo "Really Cleaning..."; \
	$(RM) -rf ../bin configure config.status config.log autom4te.cache Makeconf

dist : all
