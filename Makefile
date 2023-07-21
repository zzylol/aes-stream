TARGET ?= aes_stream
SRC_DIRS ?= ./src

SRCS := $(shell find $(SRC_DIRS) -name *.c -or -name *.s)
OBJS := $(addsuffix .o,$(basename $(SRCS)))
DEPS := $(OBJS:.o=.d)

INC_DIRS := $(shell find $(SRC_DIRS) -type d)
INC_FLAGS := $(addprefix -I,$(INC_DIRS))

CFLAGS ?= $(INC_FLAGS) -g0 -O3 -march=native -Wall -Wextra -Ofast -maes 

CFLAGS += -g

LDLIBS = -pthread

$(TARGET): $(OBJS)
	@echo $(SRCS)
	gcc $(CPPFLAGS) $(LDFLAGS) $(OBJS) -o $@ $(LDLIBS)

.PHONY: clean
clean:
	$(RM) $(TARGET) $(OBJS) $(DEPS)

-include $(DEPS)
