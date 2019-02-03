MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
PROJ_SRC_PATH := $(notdir $(patsubst %/,%,$(dir $(MKFILE_PATH))))
ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
EXEC_DIR := /usr/share/page-multiplexer
CONF_DIR := /etc/hippod


help:
	@echo "install - install page-multiplexer"

all:
	help

install:
	mkdir -p $(EXEC_DIR)
	cp -r $(ROOT_DIR)/* $(EXEC_DIR)
	cp page-multiplexer.service /lib/systemd/system/
	chmod 644 /lib/systemd/system/page-multiplexer.service
	@echo "now call systemctl daemon-reload"
	@echo ".. enable service via: systemctl enable page-multiplexer.service"
	@echo ".. start service via: systemctl start page-multiplexer.service"
	@echo ".. status via: systemctl status page-multiplexer.service"
	@echo ".. logging via: journalctl -u page-multiplexer.service"
	@echo ""
