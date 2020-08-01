# Name of the project
PROJECT_NAME = Calculator

# Output directory
BUILD = build

# All source code files
SRC = calculator.c\
src/calculator_operations.c\

TEST_SRC = src/calculator_operations.c\
test/test_calculator_operations.c
TEST_OUTPUT = $(BUILD)/Test_$(PROJECT_NAME).out
# All include folders with header files
INC	= inc

PROJECT_OUTPUT = $(BUILD)/$(PROJECT_NAME).out
# Document files
DOCUMENTION_FILE = doc/Doxyfile
DOCUMENTATION_OUTPUT = doc/html

# Default target built
$(PROJECT_NAME):all

# Run the target even if the matching name exists
.PHONY: run clean test  doc all

all: $(SRC) $(BUILD)
	gcc $(SRC) -I$(INC) -o $(PROJECT_OUTPUT).out

# Call `make run` to run the application
run:$(PROJECT_NAME)
	./$(PROJECT_OUTPUT).out

# Document the code using Doxygen
doc:
	doxygen ./doc/Doxyfile

# Build and run the unit tests
test:$(BUILD)
	gcc $(TEST_SRC) -I$(INC) -o $(TEST_OUTPUT) -lcunit
	./$(TEST_OUTPUT)
# Remove all the built files, invoke by `make clean`
clean:
	rm -rf $(BUILD) $(DOCUMENTATION_OUTPUT)

# Create new build folder if not present
$(BUILD):
	mkdir build
