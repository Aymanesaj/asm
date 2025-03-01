SRC= hello.asm
SRC1= cat.asm
OBJ= hello.o
OBJ1= cat.o
BIN= hello
BIN1= cat

all: hello cat

hello: $(BIN)

cat: $(BIN1)

$(BIN1): $(OBJ1)
	@ld -o $@ $<
	@echo "Done"

$(BIN): $(OBJ)
	@ld -o $@ $<
	@echo "Done"

$(OBJ1): $(SRC1)
	@nasm -f elf64 -o $@ $<
	@echo "\033[32mCompiled\033[0m"

$(OBJ): $(SRC)
	@nasm -f elf64 -o $@ $<
	@echo "\033[32mCompiled\033[0m"

clean:
	@rm -f $(OBJ) $(OBJ1)
	@echo "\033[33mCleaned\033[0m"

fclean: clean
	@rm -f $(BIN) $(BIN1)
	@echo "\033[31mDone\033[0m"

re: fclean all
