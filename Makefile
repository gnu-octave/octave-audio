sinclude ../../Makeconf

PROGS = bin/aurecord

all: $(PROGS)

bin/aurecord: aurecord.o endpoint.o
	$(CXX) $(CXXFLAGS) -o $@ aurecord.o endpoint.o

aurecord.o endpoint.o : endpoint.h

clean: 
	-$(RM) *.o $(PROGS) core octave-core *~
