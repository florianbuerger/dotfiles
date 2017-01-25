CURRENT_DIR := $(shell pwd)

default: bash git nano textmate ruby tools
	
git:
	ln -sFf $(CURRENT_DIR)/.gitconfig $(HOME)/.gitconfig

bash:
	ln -sFf $(CURRENT_DIR)/.bashrc $(HOME)/.bashrc
	ln -sFf $(CURRENT_DIR)/.bash_profile $(HOME)/.bash_profile
	ln -sFf $(CURRENT_DIR)/.hushlogin $(HOME)/.hushlogin
	ln -sFf $(CURRENT_DIR)/.inputrc $(HOME)/.inputrc
	ln -sFf $(CURRENT_DIR)/.profile $(HOME)/.profile
	
nano:
	ln -sFf $(CURRENT_DIR)/.nanorc $(HOME)/.nanorc
	
textmate:
	ln -sFf $(CURRENT_DIR)/.tm_properties $(HOME)/.tm_properties
	
ruby:
	ln -sFf $(CURRENT_DIR)/.gemrc $(HOME)/.gemrc
	
tools:
	ln -sFf $(CURRENT_DIR)/.bin $(HOME)/.bin