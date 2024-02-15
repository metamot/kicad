update: fetch-kicad-libs fetch-metamot-libs fetch-my-libs
	rm -fr all-symbols
	rm -fr all-footprints
	rm -fr all-packages3D
#
	mkdir -p all-symbols
	cd all-symbols && find ../my-symbols/ -maxdepth 1 -type f -exec ln -sf {} . ';'
	cd all-symbols && find ../metamot-symbols/ -maxdepth 1 -type f -exec ln -sf {} . ';'
	cd all-symbols && find ../kicad-symbols/ -maxdepth 1 -type f -exec ln -sf {} . ';'
	rm -f  all-symbols/.git*
	rm -f  all-symbols/README*
	rm -f  all-symbols/*.txt
	rm -f  all-symbols/*.md
	rm -f  all-symbols/*.sp
	rm -f  all-symbols/sym-lib-table
#
	mkdir -p all-footprints
	cd all-footprints && find ../my-footprints/ -maxdepth 1 -type d -exec ln -sf {} . ';'
	rm -fr all-footprints/my-footprints
	cd all-footprints && find ../metamot-footprints/ -maxdepth 1 -type d -exec ln -sf {} . ';'
	rm -fr all-footprints/metamot-footprints
	cd all-footprints && find ../kicad-footprints/ -maxdepth 1 -type d -exec ln -sf {} . ';'
	rm -fr all-footprints/kicad-footprints
	rm -fr all-footprints/.git
	rm -fr all-footprints/Sources
	rm -fr all-footprints/CMakeModules
#
	mkdir -p all-packages3D
	cd all-packages3D && find ../my-packages3D/ -maxdepth 1 -type d -exec ln -sf {} . ';'
	cd all-packages3D && find ../metamot-packages3D/ -maxdepth 1 -type d -exec ln -sf {} . ';'
	rm -fr all-footprints/metamot-packages3D
	cd all-packages3D && find ../kicad-packages3D/ -maxdepth 1 -type d -exec ln -sf {} . ';'
	rm -fr all-packages3D/.git
	rm -fr all-packages3D/CmakeModules
	rm -fr all-packages3D/kicad-footprints

fetch-kicad-libs: kicad-symbols/.git/config kicad-footprints/.git/config kicad-packages3D/.git/config
	cd kicad-symbols && git fetch --all
	cd kicad-footprints && git fetch --all
	cd kicad-packages3D && git fetch --all

fetch-my-libs: my-symbols/.gitignore my-footprints/.gitignore my-packages3D/.gitignore

fetch-metamot-libs: metamot-symbols/.gitignore metamot-footprints/.gitignore metamot-packages3D/.gitignore

my-symbols/.gitignore:
	mkdir -p my-symbols && touch $@
my-footprints/.gitignore:
	mkdir -p my-footprints && touch $@
my-packages3D/.gitignore:
	mkdir -p my-packages3D && touch $@

metamot-symbols/.gitignore:
	mkdir -p metamot-symbols && touch $@
metamot-footprints/.gitignore:
	mkdir -p metamot-footprints && touch $@
metamot-packages3D/.gitignore:
	mkdir -p metamot-packages3D && touch $@

kicad-symbols/.git/config:
	git clone https://gitlab.com/kicad/libraries/kicad-symbols.git kicad-symbols
kicad-footprints/.git/config:
	git clone https://gitlab.com/kicad/libraries/kicad-footprints.git kicad-footprints
kicad-packages3D/.git/config:
	git clone https://gitlab.com/kicad/libraries/kicad-packages3D.git kicad-packages3D

clean:
	rm -fr all-*
	rm -fr kicad-*

deepclean: clean
	rm -fr my-*
	