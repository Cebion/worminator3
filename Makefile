#
#
# Makefile for GCW Zero
#
#

TARGET = worminator

CC = mipsel-linux-gcc
#CC = gcc

CFLAGS = -g -O2 -Wall -Wno-deprecated-declarations -Wno-char-subscripts \
	 -fsigned-char -DDATADIR=\"./data/\"
LDFLAGS = `allegro-config --libs` -lm

OBJ 	= src/worminator.o

all : $(TARGET)

$(TARGET) : $(OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

%.o : %.c
	$(CC) -c $(CFLAGS) $< -o $@

clean :
	rm -rf src/*.o $(TARGET)
