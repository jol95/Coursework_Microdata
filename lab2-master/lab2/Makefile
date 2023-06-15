FILE = lab2.s
FILES = init.s lab2.s int_handler.s

pipe:
	sde-as -march=r3k -O0 $(FILE) -o test.o
	sde-ld -T linker_script test.o -o a.out
	sde-objdump -h -z -s -d -t a.out > mips_pipe_program.objdump
	rm a.out test.o

pipe_ext:
	sde-as -march=r3k -O0 $(FILES) -o test.o
	sde-ld -T linker_script test.o -o a.out
	sde-objdump -h -z -s -d -t a.out > mips_ext_program.objdump
	rm a.out test.o


