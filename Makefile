CURRENT_DIR := $(shell pwd)

default: git shell vim textmate ruby bin
	
git:
	ln -sFf $(CURRENT_DIR)/.gitconfig $(HOME)/.gitconfig
	ln -sFf $(CURRENT_DIR)/.gitignore_global $(HOME)/.gitignore_global

shell:
	ln -sFf $(CURRENT_DIR)/.zshenv $(HOME)/.zshenv
	ln -sFf $(CURRENT_DIR)/.zshrc $(HOME)/.zshrc
	ln -sFf $(CURRENT_DIR)/.hushlogin $(HOME)/.hushlogin
	ln -sFf $(CURRENT_DIR)/.inputrc $(HOME)/.inputrc
	ln -sFf $(CURRENT_DIR)/.zsh $(HOME)/.zsh
	
vim:
	ln -sFf $(CURRENT_DIR)/.vimrc $(HOME)/.vimrc

textmate:
	ln -sFf $(CURRENT_DIR)/.tm_properties $(HOME)/.tm_properties

ruby:
	ln -sFf $(CURRENT_DIR)/.gemrc $(HOME)/.gemrc

bin:
	ln -sFf $(CURRENT_DIR)/.bin $(HOME)/.bin
