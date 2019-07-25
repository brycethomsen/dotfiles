OS = $(shell uname -s)

os:
ifeq ($(OS), Linux)
	$(eval OS := linux)
endif
ifeq ($(OS), Darwin)
	$(eval OS := mac)
endif

all: os init pakages dots
	# set 'em all up

init: os
	# Install on new 'puter

dots: os
	# Install dotfiles

packages: os
	# Installs packages

get-crontab: os
	mv crontab/mac/crontab crontab/$(OS)/crontab.old
	crontab -l > crontab/$(OS)/crontab
