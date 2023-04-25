CXX = g++
CXXFLAGS = -Wall -std=c++11
LDFLAGS = -lncursesw
SRCS = diamond.cpp engine.cpp entities.cpp malph.cpp moving.cpp poter.cpp
OBJS = $(SRCS:.cpp=.o)
TARGET = game

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS) $(LDFLAGS)

clean:
	rm -f $(OBJS) $(TARGET)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

run: $(TARGET)
	./$(TARGET)

.PHONY: all clean run
