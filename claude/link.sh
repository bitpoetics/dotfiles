#!/bin/sh

printf "\033[33m%s\033[m\n" "Configuring Claude..."

CLAUDE_DIR="$HOME/.claude"

if [ ! -d "$CLAUDE_DIR" ]; then
    mkdir -p "$CLAUDE_DIR"
fi

# CLAUDE.md
ln -sf "$DOTFILES_DIR/claude/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
echo "Created symlink: $CLAUDE_DIR/CLAUDE.md -> $DOTFILES_DIR/claude/CLAUDE.md"

# agents
ln -sfn "$DOTFILES_DIR/claude/agents" "$CLAUDE_DIR/agents"
echo "Created symlink: $CLAUDE_DIR/agents -> $DOTFILES_DIR/claude/agents"

# commands
ln -sfn "$DOTFILES_DIR/claude/commands" "$CLAUDE_DIR/commands"
echo "Created symlink: $CLAUDE_DIR/commands -> $DOTFILES_DIR/claude/commands"

# hooks
ln -sfn "$DOTFILES_DIR/claude/hooks" "$CLAUDE_DIR/hooks"
echo "Created symlink: $CLAUDE_DIR/hooks -> $DOTFILES_DIR/claude/hooks"

# rules
ln -sfn "$DOTFILES_DIR/claude/rules" "$CLAUDE_DIR/rules"
echo "Created symlink: $CLAUDE_DIR/rules -> $DOTFILES_DIR/claude/rules"

# scripts
ln -sfn "$DOTFILES_DIR/claude/scripts" "$CLAUDE_DIR/scripts"
echo "Created symlink: $CLAUDE_DIR/scripts -> $DOTFILES_DIR/claude/scripts"

# skills
ln -sfn "$DOTFILES_DIR/claude/skills" "$CLAUDE_DIR/skills"
echo "Created symlink: $CLAUDE_DIR/skills -> $DOTFILES_DIR/claude/skills"

# keybindings.json
ln -sf "$DOTFILES_DIR/claude/keybindings.json" "$CLAUDE_DIR/keybindings.json"
echo "Created symlink: $CLAUDE_DIR/keybindings.json -> $DOTFILES_DIR/claude/keybindings.json"

# statusline.sh
ln -sf "$DOTFILES_DIR/claude/statusline.sh" "$CLAUDE_DIR/statusline.sh"
echo "Created symlink: $CLAUDE_DIR/statusline.sh -> $DOTFILES_DIR/claude/statusline.sh"

