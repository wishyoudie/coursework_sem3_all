all: output

output: main.o findlib.a
	mingw32-gcc-6.3.0 main.o findlib.a -o output

main.o: main.c
	mingw32-gcc-6.3.0 -c main.c

findlib.a: find.o find.h
	mingw32-gcc-ar -rsc findlib.a find.o

find.o: find.c
	mingw32-gcc-6.3.0 -c find.c

clean:
	del -rf *.a *.o *.exe output