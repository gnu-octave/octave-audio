sinclude Makeconf

ifdef HAVE_LINUX_SOUNDCARD
	PROG=aurecord
endif

all: $(PROG)

aurecord: aurecord.o endpoint.o
	$(CXX) $(CXXFLAGS) -o $@ aurecord.o endpoint.o

aurecord.o endpoint.o : endpoint.h

clean: ; -$(RM) *.o core octave-core bin/* *~
