# Config
BUILD_TARGET = out

# Executables
MD := mkdir
RM := rm
T := touch
CP := cp
CC := g++

# Rules
.PHONY: all

all: copy secrets

copy:
	mkdir -p $(BUILD_TARGET)
	$(CP) -R badusb/* $(BUILD_TARGET)
	ls -l $(BUILD_TARGET)

secrets:
	find $(BUILD_TARGET) -type f -name "*.txt" -print0 | xargs -0 sed -i '' -e 's/DROPBOX_BEARER_TOKEN/${DROPBOX_BEARER_TOKEN}/g'
