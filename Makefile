CFLAGS = -g -Os -Wall -I"$(ERTS_INCLUDE_DIR)" -Ic_src
LDFLAGS =

PRIV_DIR = $(MIX_APP_PATH)/priv
LIB_NAME = $(PRIV_DIR)/bcrypt_nif.so

NIF_SRC = \
	c_src/bcrypt_nif.c \
	c_src/blowfish.c

calling_from_make:
	mix compile

all: ${PRIV_DIR} ${LIB_NAME}

${LIB_NAME}: ${NIF_SRC}
	$(CC) ${CFLAGS} -shared ${LDFLAGS} ${NIF_SRC} -o ${LIB_NAME}

${PRIV_DIR}:
	mkdir -p ${PRIV_DIR}

clean:
	rm -f ${LIB_NAME}

.PHONY: all clean
