## macの初期セットアップ

### 構成

```
dotfiles/
├── bin/
│   ├── init.sh       # Homebrew・vim-plug などのインストール
│   └── link.sh       # シンボリックリンクの作成
├── home/             # ~/ にリンクされるドットファイル
├── config/           # ~/.config/ にリンクされる設定ファイル
│   └── ghostty/
├── Brewfile          # Homebrew でインストールするパッケージ一覧
└── Makefile
```

### セットアップ手順

#### 1. このリポジトリをクローン

```bash
git clone https://github.com/Ryu955/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

#### 2. Xcode Command Line Tools・Homebrew・vim-plug をインストール

```bash
make init
```

#### 3. シンボリックリンクを作成

```bash
make link
```

`home/` 以下のファイルが `~/` に、`config/` 以下が `~/.config/` にリンクされる。

#### 4. Brewfile からパッケージをインストール

```bash
make brew
```

### その他の設定

#### skhd

アクセシビリティの権限が必要なのだ。

- システム設定 > プライバシーとセキュリティ > アクセシビリティ から skhd を許可する

#### Brewfile の更新

現在の Homebrew 環境を Brewfile に書き出す場合:

```bash
make recreate_brew_file
```
