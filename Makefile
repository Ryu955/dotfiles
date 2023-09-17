init:
	make link
	bin/init.sh
	make brew

link:
	bin/link.sh

brew:
	brew bundle -v --file=./Brewfile

# brew fileの作成
recreate_brew_file:
	rm -rf Brewfile
	brew bundle dump

