CURRENT_DIR := $(shell pwd)

default: git vim ruby bin zsh lldb npm android

dirs:
	mkdir -p $(HOME)/.config/nvim
	mkdir -p $(HOME)/.config/alacritty/
	mkdir -p $(HOME)/.config/fish

git:
	ln -sFf $(CURRENT_DIR)/.gitconfig $(HOME)/.gitconfig
	ln -sFf $(CURRENT_DIR)/.gitignore_global $(HOME)/.gitignore_global

zsh:
	ln -sFf $(CURRENT_DIR)/.zshrc $(HOME)/.zshrc
	ln -sFf $(CURRENT_DIR)/.hushlogin $(HOME)/.hushlogin

bash:
	ln -sFf $(CURRENT_DIR)/.bashrc $(HOME)/.bashrc
	ln -sFf $(CURRENT_DIR)/.bash_profile $(HOME)/.bash_profile
	ln -sFf $(CURRENT_DIR)/.inputrc $(HOME)/.inputrc

fish:
	ln -sFf $(CURRENT_DIR)/fish $(HOME)/.config/fish

vim:
	ln -sFf $(CURRENT_DIR)/.vimrc $(HOME)/.vimrc
	ln -sFf $(CURRENT_DIR)/.vim $(HOME)/.vim

textmate:
	ln -sFf $(CURRENT_DIR)/.tm_properties $(HOME)/.tm_properties

ruby:
	ln -sFf $(CURRENT_DIR)/.gemrc $(HOME)/.gemrc

bin:
	ln -sFf $(CURRENT_DIR)/.bin $(HOME)/.bin

android:
	ln -sFf $(CURRENT_DIR)/android/advancedFeatures.ini $(HOME)/.android/advancedFeatures.ini

tmux:
	ln -sFf $(CURRENT_DIR)/.tmux.conf $(HOME)/.tmux.conf

lldb:
	ln -sFf $(CURRENT_DIR)/.lldbinit $(HOME)/.lldbinit

npm:
	ln -sFf $(CURRENT_DIR)/.npmrc $(HOME)/.npmrc

alacritty:
	ln -sFf $(CURRENT_DIR)/alacritty.yml $(HOME)/.config/alacritty/alacritty.yml

wm:
	ln -sFf $(CURRENT_DIR)/.chunkwmrc $(HOME)/.chunkwmrc
	ln -sFf $(CURRENT_DIR)/.khdrc $(HOME)/.khdrc

neovim:
	ln -sFf $(CURRENT_DIR)/.config/nvim/init.vim $(HOME)/.config/nvim/init.vim

.PHONY: fish
