#!/bin/bash
set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

# dotconfigのディレクトリを取得
DOTCONFIG_DIR=$(dirname $THIS_DIR)/dotconfig

cd $DOTCONFIG_DIR

echo "start setup..."

echo "setup dotfiles..."

for f in .??*; do
    [ "$f" = ".gitignore" ] && continue
    [ "$f" = ".gitmodules" ] && continue
    [ "$f" = ".DS_Store" ] && continue

    ln -snfv $DOTCONFIG_DIR/"$f" ~/
done

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END

