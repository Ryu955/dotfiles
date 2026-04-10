#!/bin/bash
set -u

THIS_DIR=$(cd $(dirname $0); pwd)
REPO_DIR=$(dirname $THIS_DIR)

# home/ 以下のドットファイルを ~/ にリンク
HOME_DIR=$REPO_DIR/home

cd $HOME_DIR

echo "start setup..."
echo "setup home dotfiles..."

for f in .??*; do
    [ "$f" = ".gitignore" ] && continue
    [ "$f" = ".gitmodules" ] && continue
    [ "$f" = ".DS_Store" ] && continue

    ln -snfv $HOME_DIR/"$f" ~
done

# config/ 以下を ~/.config/ にリンク
CONFIG_DIR=$REPO_DIR/config

if [ -d "$CONFIG_DIR" ]; then
    echo "setup .config dotfiles..."
    mkdir -p ~/.config
    for d in "$CONFIG_DIR"/*/; do
        name=$(basename "$d")
        ln -snfv "$d" ~/.config/
    done
fi

# claude/ 以下を ~/.claude/ にリンク
CLAUDE_DIR=$REPO_DIR/claude

if [ -d "$CLAUDE_DIR" ]; then
    echo "setup .claude dotfiles..."
    mkdir -p ~/.claude
    for f in "$CLAUDE_DIR"/*; do
        name=$(basename "$f")
        ln -snfv "$f" ~/.claude/
    done
fi

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
