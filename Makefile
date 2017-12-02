CURRENT_DIR := $(shell pwd)

default: git vim ruby bin bash tmux lldb npm android

git:
	ln -sFf $(CURRENT_DIR)/.gitconfig $(HOME)/.gitconfig
	ln -sFf $(CURRENT_DIR)/.gitignore_global $(HOME)/.gitignore_global

zsh:
	ln -sFf $(CURRENT_DIR)/.zshenv $(HOME)/.zshenv
	ln -sFf $(CURRENT_DIR)/.zshrc $(HOME)/.zshrc
	ln -sFf $(CURRENT_DIR)/.hushlogin $(HOME)/.hushlogin
	ln -sFf $(CURRENT_DIR)/.zsh $(HOME)/.zsh

bash:
	ln -sFf $(CURRENT_DIR)/.bashrc $(HOME)/.bashrc
	ln -sFf $(CURRENT_DIR)/.bash_profile $(HOME)/.bash_profile
	ln -sFf $(CURRENT_DIR)/.inputrc $(HOME)/.inputrc

fish:
	mkdir -p $(HOME)/.config
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
