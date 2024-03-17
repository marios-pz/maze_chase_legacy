CC := g++
CFLAGS := -std=c++11 -Wall
SRC_DIR := src
BIN_DIR := bin
SRCS := $(wildcard $(SRC_DIR)/*.cpp)
OBJS := $(SRCS:$(SRC_DIR)/%.cpp=$(BIN_DIR)/%.o)
TARGET := $(BIN_DIR)/maze_curses
LDFLAGS := -lncurses
all: $(TARGET)

$(TARGET): $(OBJS) | $(BIN_DIR)
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

$(BIN_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BIN_DIR)
	$(CC) $(CFLAGS) -c $< -o $@ -lncurses

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

clean:
	$(RM) -r $(BIN_DIR)

.PHONY: all clean
