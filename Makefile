init:
	bin/init.sh
	make link
	make brew

link:
	bin/link.sh

brew:
	brew bundle -v --file=./Brewfile

# brew fileの作成
recreate_brew_file:
	rm -rf Brewfile
	brew bundle dump

