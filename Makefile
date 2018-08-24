CURRENT_DIR := $(shell pwd)

default: git ruby bin zsh lldb npm android neovim term

git:
	ln -sFf "$(CURRENT_DIR)/.gitconfig" $(HOME)/.gitconfig
	ln -sFf "$(CURRENT_DIR)/.gitignore_global" $(HOME)/.gitignore_global

zsh:
	ln -sFf "$(CURRENT_DIR)/.zshrc" $(HOME)/.zshrc
	ln -sFf "$(CURRENT_DIR)/.hushlogin" $(HOME)/.hushlogin

ruby:
	ln -sFf "$(CURRENT_DIR)/.gemrc" $(HOME)/.gemrc

bin:
	ln -sFf "$(CURRENT_DIR)/.bin" $(HOME)/.bin

android:
	ln -sFf $(CURRENT_DIR)/android/advancedFeatures.ini $(HOME)/.android/advancedFeatures.ini

tmux:
	ln -sFf $(CURRENT_DIR)/.tmux.conf $(HOME)/.tmux.conf

lldb:
	ln -sFf $(CURRENT_DIR)/.lldbinit $(HOME)/.lldbinit

npm:
	ln -sFf $(CURRENT_DIR)/.npmrc $(HOME)/.npmrc

neovim:
	mkdir -p $(HOME)/.config/nvim/
	ln -sFf $(CURRENT_DIR)/init.vim $(HOME)/.config/nvim/init.vim

term: 
	tic -x tmux-256color.terminfo
	tic -x xterm-256color-italic.terminfo

.PHONY: zsh
