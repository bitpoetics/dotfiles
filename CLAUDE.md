# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## リポジトリ概要

macOS開発環境のdotfiles管理リポジトリ。シンボリックリンク方式で各設定ファイルをホームディレクトリに配置する。

## セットアップ

```shell
./bootstrap.sh    # 全環境を一括セットアップ
exec $SHELL -l    # 新しいシェル環境を読み込み
```

`bootstrap.sh` は以下を順次実行する:
1. `macos.sh` — macOSシステム設定
2. `tools.sh` — Command Line Tools
3. `link.sh` — シンボリックリンク（各サブディレクトリの `link.sh` をチェーン実行）
4. `homebrew.sh` — Homebrewインストール・パッケージ復元
5. `change_shell.sh` — デフォルトシェルをzshに変更

## アーキテクチャ

各ツール領域がサブディレクトリとして独立し、それぞれ `link.sh` を持つ:

| リンク元 | リンク先 |
|---|---|
| `~/.claude/CLAUDE.md` | `claude/CLAUDE.md` |
| `~/.claude/agents/` | `claude/agents/` |
| `~/.claude/commands/` | `claude/commands/` |
| `~/.claude/hooks/` | `claude/hooks/` |
| `~/.claude/rules/` | `claude/rules/` |
| `~/.claude/scripts/` | `claude/scripts/` |
| `~/.claude/skills/` | `claude/skills/` |
| `~/.claude/keybindings.json` | `claude/keybindings.json` |
| `~/.claude/statusline.sh` | `claude/statusline.sh` |
| `~/.config/git/config` | `git/config` |
| `~/.config/git/ignore` | `git/ignore` |
| `~/.zshenv` | `zsh/zshenv` |
| `~/.zshrc` | `zsh/zshrc` |
| `~/.zshrc.aliases` | `zsh/zshrc.aliases` |
| `~/.zprofile` | `zsh/zprofile` |
| `~/.vimrc` | `vim/vimrc` |
| `~/.Brewfile` | `homebrew/Brewfile` |

端末固有の設定は `~/.zshrc.local` に記載する。このファイルはリポジトリに含まれず、`.zshrc` から存在時のみ `source` される。

ルートの `link.sh` が全サブディレクトリの `link.sh` を呼び出す統合エントリーポイント。

## 新しいツール設定を追加する場合

1. サブディレクトリを作成（例: `neovim/`）
2. 設定ファイルを配置
3. `link.sh` を作成（シンボリックリンク定義）
4. ルートの `link.sh` に呼び出しを追加
5. 必要に応じて `homebrew/Brewfile` にパッケージを追加

## シェルスクリプトの規約

- シンボリックリンクはファイルに `ln -sf`、ディレクトリに `ln -sfn` で作成
- スクリプト冒頭で `DOTFILES_DIR` を定義してパスを解決

