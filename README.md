# dot vim

## Adding new plugins
	
	git submodule add $URL pack/jasperla/{opt,start}/plugin
	git commit .gitmodules path/to/plugin

## Updating packages

	make update

## Removing a package

	git submodule deinit path/to/plugin
