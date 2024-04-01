default:
ifeq ($(CROSS_COMPILE), aarch64-none-linux-gnu-)
	aarch64-none-linux-gnu-gcc -o writer writer.c
else
	gcc -o writer writer.c
endif

.PHONY : clean
clean:
	-rm -f writer *.o
