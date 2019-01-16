CURRENT_DIR := $(shell pwd)

default: git ruby bin fish lldb npm android term tmux

git:
	ln -sFf "$(CURRENT_DIR)/.gitconfig" $(HOME)/.gitconfig
	ln -sFf "$(CURRENT_DIR)/.gitignore_global" $(HOME)/.gitignore_global

zsh:
	ln -sFf "$(CURRENT_DIR)/.zshrc" $(HOME)/.zshrc
	ln -sFf "$(CURRENT_DIR)/.hushlogin" $(HOME)/.hushlogin

bash:
	ln -sFf "$(CURRENT_DIR)/.bashrc" $(HOME)/.bashrc
	ln -sFf "$(CURRENT_DIR)/.hushlogin" $(HOME)/.hushlogin
	ln -sFf "$(CURRENT_DIR)/.bash_profile" $(HOME)/.bash_profile

ruby:
	ln -sFf "$(CURRENT_DIR)/.gemrc" $(HOME)/.gemrc

bin:
	ln -sFf "$(CURRENT_DIR)/.bin" $(HOME)

android:
	ln -sFf $(CURRENT_DIR)/android/advancedFeatures.ini $(HOME)/.android/advancedFeatures.ini

tmux:
	ln -sFf $(CURRENT_DIR)/.tmux.conf $(HOME)/.tmux.conf

lldb:
	ln -sFf $(CURRENT_DIR)/.lldbinit $(HOME)/.lldbinit

npm:
	ln -sFf $(CURRENT_DIR)/.npmrc $(HOME)/.npmrc

neovim:
	mkdir -p $(HOME)/.config/nvim
	ln -sFf $(CURRENT_DIR)/nvim/init.vim $(HOME)/.config/nvim/init.vim

tig:
	ln -sFf $(CURRENT_DIR)/.tigrc $(HOME)/.tigrc

fish:
	mkdir -p $(HOME)/.config/fish
	ln -sFf $(CURRENT_DIR)/fish $(HOME)/.config/fish

alacritty:
	mkdir -p $(HOME)/.config/alacritty
	ln -sFf $(CURRENT_DIR)/alacritty $(HOME)/.config/alacritty

.PHONY: zsh
