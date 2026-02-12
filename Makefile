CF = gfortran
FLAGS = -Wall -Wextra -std=f2008 -O2 -J$(BUILD)

# order on dependencies
SRC = \
    constants/constants.f90 \
    conversions/conversions.f90 \
    trigonometry/math_trig_degrees.f90 \
    test/test_trig.f90

OBJ = $(patsubst %.f90,$(BUILD)/%.o,$(SRC))

TARGET = formaths
BUILD = build

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CF) $(FLAGS) -o $@ $(OBJ)

$(BUILD)/%.o: %.f90
	@mkdir -p $(dir $@)
	$(CF) $(FLAGS) -c $< -o $@

clean:
	rm -f $(BUILD) $(TARGET)
