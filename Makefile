#
#
# Makefile for GCW Zero
#
#

TARGET = worminator

DINGUX = 1

CC = mipsel-linux-gcc
#CC = gcc

CFLAGS = -g -O2 -Wall -Wno-deprecated-declarations -Wno-char-subscripts \
	-Wno-unused-but-set-variable -fsigned-char -DDATADIR=\"./data/\"
LDFLAGS = `allegro-config --libs` -lm

ifdef DINGUX
	CFLAGS += -DDINGUX
endif

OBJ 	= src/worminator.o

all : $(TARGET)

$(TARGET) : $(OBJ)
	$(CC) $^ $(LDFLAGS) -o $@

%.o : %.c
	$(CC) -c $(CFLAGS) $< -o $@

clean :
	rm -rf src/*.o $(TARGET)

src/worminator.o : src/animation.h src/beams.h src/civilian_ai.h \
		   src/demo.h src/editor.h src/enemy_ai.h src/globals.h \
		   src/grphdefs.h src/infodefs.h src/item_ai.h \
		   src/load_utils.h src/menus.h src/misc_ai.h \
		   src/particle_ai.h src/player.h src/projectile_ai.h \
		   src/prototypes.h src/scripts.h src/sound.h src/spawn_ai.h \
		   src/sprites.h src/text.h src/unix.h src/wormdata.h
