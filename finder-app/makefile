default:
ifeq ($(CROSS_COMPILE), aarch64-none-linux-gnu-)
	aarch64-none-linux-gnu-g++ -o writer writer.c
else
	g++ -o writer writer.c
endif

.PHONY : clean
clean:
	-rm -f writer *.o
