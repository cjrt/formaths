CF = gfortran
FLAGS = -Wall -Wextra -std=f2008 -O2 -Jbuild

BUILD = build

SRC = $(wildcard constants/*.f90) \
      $(wildcard conversions/*.f90) \
      $(wildcard trigonometry/*.f90) \
      $(wildcard physics/*.f90) \
      $(wildcard test/*.f90)   # optional

OBJ = $(patsubst %.f90,$(BUILD)/%.o,$(SRC))

LIB = libformaths.a

all: $(LIB)

$(BUILD)/%.o: %.f90
	@mkdir -p $(dir $@)
	$(CF) $(FLAGS) -c $< -o $@

$(LIB): $(OBJ)
	ar rcs $@ $(OBJ)
	@echo "Library $(LIB) made"

clean:
	rm -rf $(BUILD) $(LIB)

run: all
	$(CF) -I$(BUILD) test/test.f90 $(LIB) -o test_program
	./test_program

