sinclude Makeconf

ifneq (,$(findstring test,$(MAKECMDGOALS)))
CXXFLAGS := $(CXXFLAGS) -DTEST
TEST = -DTEST
endif

ifdef HAVE_LINUX_SOUNDCARD
all: aurecord.oct
	$(MKOCTFILE) -DHAVE_CONFIG_H aurecord.cc endpoint.cc

test: aurecord

else
all:

test:

endif

aurecord: aurecord.o endpoint.o
	$(CXX) $(CXXFLAGS) -o $@ aurecord.o endpoint.o

aurecord.o endpoint.o : endpoint.h

%.o: %.cc ; $(MKOCTFILE) $(TEST) -c $<

clean: ; -$(RM) *.o core octave-core ../bin/* *~ *.oct
