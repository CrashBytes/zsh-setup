# Modular ZSH Configuration

Clean, professional zsh configuration using Oh My Zsh with modular file organization.

## Structure

```
~/.zshrc.d/
├── 20-prompt.zsh         # Prompt configuration and functions
├── 30-ohmyzsh.zsh        # Oh My Zsh settings and plugins
├── 40-exports.zsh        # Environment variable exports
├── 50-paths.zsh          # PATH modifications
├── 60-tools.zsh          # Tool initialization (NVM, Google Cloud SDK)
├── 70-aliases.zsh        # Custom aliases
└── README.md             # This file
```

Files are numbered to control load order.

## Dependencies

### Required

- **[Oh My Zsh](https://ohmyz.sh/)** - Framework for managing zsh configuration
  ```bash
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```

- **Agnoster Theme** - Included with Oh My Zsh by default

### Optional Development Tools

These are referenced in the config but not required:

- **Android SDK** - For Android development
- **NVM** - Node Version Manager for Node.js development
- **Google Cloud SDK** - For GCP development
- **.NET SDK** - For .NET development

### Optional Plugins

Commented out in `30-ohmyzsh.zsh` - install if desired:

```bash
# Via Homebrew
brew install zsh-autosuggestions zsh-syntax-highlighting

# Or via Oh My Zsh custom plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Then uncomment the plugin lines in `30-ohmyzsh.zsh`.

## Installation

### Option 1: Clone to .zshrc.d

```bash
# Clone this repo
git clone <your-repo-url> ~/.zshrc.d

# Add loader to your ~/.zshrc
cat >> ~/.zshrc << 'EOF'

# Load modular zsh configuration
setopt EXTENDED_GLOB
setopt NULL_GLOB
ZDOTDIR="${ZDOTDIR:-$HOME}"
if [ -d "$ZDOTDIR/.zshrc.d" ]; then
  for _z in "$ZDOTDIR"/.zshrc.d/*.zsh(.N); do
    source "$_z"
  done
fi
unset _z
EOF

# Reload
source ~/.zshrc
```

### Option 2: Manual Installation

```bash
# Create directory
mkdir -p ~/.zshrc.d

# Copy individual files
cp *.zsh ~/.zshrc.d/

# Add loader to ~/.zshrc (same as above)
```

## Customization

### Adding Your Own Configurations

Create new numbered files in `~/.zshrc.d/`:

```bash
# Example: Add work-specific aliases
echo "alias deploy='./deploy.sh'" > ~/.zshrc.d/80-work.zsh
```

Files are loaded in numerical order, so:
- `20-` loads first
- `80-` loads last

### Modifying Existing Files

Edit any file in `~/.zshrc.d/` and reload:

```bash
nano ~/.zshrc.d/70-aliases.zsh
source ~/.zshrc
```

### Disabling Optional Features

Comment out lines you don't need:

```bash
# In 50-paths.zsh - comment out Android SDK if not needed
# export PATH="$PATH:$ANDROID_HOME/emulator"
```

## Features

### Git Aliases (70-aliases.zsh)

```bash
gs          # git status
gl          # git log --oneline --graph
gp          # git push
gpl         # git pull
gc          # git commit -m
gca         # git commit -a -m
gco         # git checkout
gcb         # git checkout -b
gcm         # git checkout main
gup         # git pull --rebase
gcl         # git clone
gclean      # git clean -fd
greset      # git reset --hard
gdiff       # git diff
gdiffc      # git diff --cached
gbranch     # git branch
gbranches   # git branch -a
gshow       # git show
gstatus     # git status -s
gstash      # git stash --include-untracked
gstashp     # git stash pop
gstashl     # git stash list
```

### Oh My Zsh Plugins (30-ohmyzsh.zsh)

- **git** - Git aliases and functions
- **sudo** - Press ESC twice to prepend sudo
- **web-search** - Search web from terminal
- **copyfile** - Copy file contents to clipboard

### Environment Configuration

All paths use `$HOME` for portability across machines.

## Troubleshooting

### Plugin Not Found

```bash
[oh-my-zsh] plugin 'plugin-name' not found
```

Either install the plugin or remove it from `30-ohmyzsh.zsh`.

### Aliases Not Working

Check if the file is being sourced:

```bash
echo $PATH | grep -o ".macbook-config"
```

If nothing prints, the file isn't loading. Verify `~/.zshrc` has the loader.

### Command Not Found

If referenced tools (Android SDK, NVM, etc.) aren't installed, comment out those sections:

```bash
# In 40-exports.zsh
# export ANDROID_HOME="$HOME/Library/Android/sdk"
```

## Contributing

This is a personal configuration, but feel free to:
- Fork for your own use
- Submit issues for bugs
- Suggest improvements via pull request

## License

MIT License - Use freely, modify as needed.

## Credits

- [Oh My Zsh](https://ohmyz.sh/) - Zsh framework
- [Agnoster](https://github.com/agnoster/agnoster-zsh-theme) - Prompt theme
