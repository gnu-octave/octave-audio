sinclude Makeconf

ifdef HAVE_LINUX_SOUNDCARD
PROG = aurecord

all: $(PROG)
	if [ ! -d ../bin ]; then mkdir ../bin; fi
	cp -pr $(PROG) ../bin
else
all:

endif

aurecord: aurecord.o endpoint.o
	$(CXX) $(CXXFLAGS) -o $@ aurecord.o endpoint.o

aurecord.o endpoint.o : endpoint.h

clean: ; -$(RM) *.o core octave-core ../bin/* *~
