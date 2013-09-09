ifneq ($(CROSS_COMPILE),)
all: arm
else
all: x86
endif

x86:
	@echo "Compiling for x86..."
	gcc -c hello.c -o hello_x86.o
	gcc hello_x86.o -o hello_x86

arm:
	@echo "Compiling for ARM..."
	$(CROSS_COMPILE)gcc -c hello.c -o hello_arm.o
	$(CROSS_COMPILE)gcc hello_arm.o -o hello_arm

clean:
	rm -f *.o hello_x86 hello_arm
