all: update

install:
	git submodule init
	git submodule update

update:
	git submodule update --remote --merge
	git commit .gitmodules pack

