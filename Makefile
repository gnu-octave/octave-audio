sinclude ../../Makeconf

ifdef HAVE_LINUX_SOUNDCARD
	PROG=bin/aurecord
endif

all: $(PROG)

bin/aurecord: aurecord.o endpoint.o
	$(CXX) $(CXXFLAGS) -o $@ aurecord.o endpoint.o

aurecord.o endpoint.o : endpoint.h

clean: ; -$(RM) *.o core octave-core bin/* *~
