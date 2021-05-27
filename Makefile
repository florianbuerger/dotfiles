CURRENT_DIR := $(shell pwd)

default: zsh man vim bin lldb git ruby

git:
	ln -sFf '$(CURRENT_DIR)/gitconfig' $(HOME)/.gitconfig
	ln -sFf '$(CURRENT_DIR)/gitignore_global' $(HOME)/.gitignore_global

zsh:
	ln -sFf '$(CURRENT_DIR)/zshrc' $(HOME)/.zshrc
	ln -sFf '$(CURRENT_DIR)/zsh' $(HOME)/.zsh
	ln -sFf '$(CURRENT_DIR)/zshenv' $(HOME)/.zshenv
	touch $(HOME)/.hushlogin

man:
	ln -sFf '$(CURRENT_DIR)/man' $(HOME)/.man

ruby:
	ln -sFf '$(CURRENT_DIR)/gemrc' $(HOME)/.gemrc

bin:
	ln -sFf '$(CURRENT_DIR)/bin' $(HOME)/.bin

lldb:
	ln -sFf '$(CURRENT_DIR)/lldbinit' $(HOME)/.lldbinit
	ln -sFf '$(CURRENT_DIR)/lldb' $(HOME)/.lldb

vim:
	ln -sFf '$(CURRENT_DIR)/vim' $(HOME)/.vim
	ln -sFf '$(CURRENT_DIR)/vimrc' $(HOME)/.vimrc

.PHONY: bin lldb zsh man
