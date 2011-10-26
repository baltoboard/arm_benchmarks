#   ----------------------------------------------------------------------------
#  @file   Makefile
#
#  @path   
#
#  @desc   Makefile for linpack for arm926ej-s (Debug and Release versions)
#
#  @ver    1.10
#   ----------------------------------------------------------------------------
#  Copyright (c) Texas Instruments Incorporated 2002-2009
#
#  Use of this software is controlled by the terms and conditions found in the
#  license agreement under which this software has been supplied or provided.
#

#   ----------------------------------------------------------------------------
#   Included defined variables
#   ----------------------------------------------------------------------------
-include ../../../../Rules.make

#   ----------------------------------------------------------------------------
#   Variables passed in externally
#   ----------------------------------------------------------------------------
PLATFORM ?=
ARCH ?=
CROSS_COMPILE ?=

#   ----------------------------------------------------------------------------
#   Name of the Linux compiler
#   ----------------------------------------------------------------------------
CC := $(CROSS_COMPILE)gcc

#   ----------------------------------------------------------------------------
#   General options, sources and libraries
#   ----------------------------------------------------------------------------
NAME := linpack
SRCS := linpack.c
HDRS :=
OBJS :=
DEBUG :=
BIN := linpack


#   ----------------------------------------------------------------------------
#   Compiler and Linker flags for Debug
#   ----------------------------------------------------------------------------
OBJDIR_D := Debug
BINDIR_D := $(OBJDIR_D)
LIBS_D := $(LIBS)
OBJS_D := $(SRCS:%.c=$(OBJDIR_D)/%.o)
ALL_DEBUG := -g3 -gdwarf-2

#   ----------------------------------------------------------------------------
#   Compiler and Linker flags for Release
#   ----------------------------------------------------------------------------
OBJDIR_R := Release
BINDIR_R := $(OBJDIR_R)
LIBS_R := $(LIBS)
OBJS_R := $(SRCS:%.c=$(OBJDIR_R)/%.o)

#   ----------------------------------------------------------------------------
#   Compiler include directories 
#   ----------------------------------------------------------------------------
INCLUDES := 

#   ----------------------------------------------------------------------------
#   All compiler options to be passed to the command line
#   ----------------------------------------------------------------------------
ALL_CFLAGS := $(INCLUDES)                  \
              -O3                          \
              -march=armv5te               \
              -mtune=arm926ej-s            \
              -fmessage-length=0           \
              -c                           \
              $(CFLAGS)

LDFLAGS :=    -march=armv5te               \
              -mtune=arm926ej-s            \
              -Wl,-O1                      \
              -Wl,--hash-style=gnu         \
              -lm

#   ----------------------------------------------------------------------------
#   Compiler symbol definitions 
#   ----------------------------------------------------------------------------
DEFS := -DUNROLL                          \
        -DSP

#   ----------------------------------------------------------------------------
#   Compiler and Linker procedure
#   From this point and on changes are very unlikely.
#   ----------------------------------------------------------------------------
.PHONY: all
all: debug release

#   ----------------------------------------------------------------------------
#   Building Debug... 
#   ----------------------------------------------------------------------------
.PHONY: debug
debug: $(BINDIR_D)/$(BIN)

$(BINDIR_D)/$(BIN): $(OBJS_D)
	@echo Compiling Debug...
	$(CC) -o $@ $(OBJS_D) $(LIBS_D) $(LDFLAGS)  -Wl,-Map,$(BINDIR_D)/$(NAME).map

$(OBJDIR_D)/%.o : %.c $(HDRS)
	$(CC) $(ALL_DEBUG) $(DEFS) $(ALL_CFLAGS) -o$@ $<

#   ----------------------------------------------------------------------------
#   Building Release... 
#   ----------------------------------------------------------------------------
.PHONY: release
release: $(BINDIR_R)/$(BIN)

$(BINDIR_R)/$(BIN): $(OBJS_R)
	@echo Compiling Release...
	$(CC) -o $@ $(OBJS_R) $(LIBS_R) $(LDFLAGS) -Wl,-Map,$(BINDIR_R)/$(NAME).map

$(OBJDIR_R)/%.o : %.c $(HDRS)
	$(CC) $(DEFS) $(ALL_CFLAGS) -o$@ $<

.PHONY: clean
clean:
	@rm -f $(OBJDIR_D)/*
	@rm -f $(OBJDIR_R)/*

