CC=gcc
SOURCE=./%.c 
CFLAGS=-ggdb -std=c11
BINS=step0 step01 step02 step03 step04 step05 step06 step07 step08 step09 step10

all : $(BINS)

$(BINS): %: %.c
	$(CC) $(CFLAGS) -o $@.out $^ 

.PHONY: clean

clean:
	@echo -e ">> Removing all binaries..."
	@rm -f *.out
	@echo -e ">> Done!"
