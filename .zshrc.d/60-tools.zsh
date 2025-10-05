[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
[ -f '/Users/loaclme/yandex-cloud/path.bash.inc' ] && source '/Users/loaclme/yandex-cloud/path.bash.inc'
[ -f '/Users/loaclme/yandex-cloud/completion.zsh.inc' ] && source '/Users/loaclme/yandex-cloud/completion.zsh.inc'
[ -f "/opt/homebrew/share/google-cloud-sdk/path.zsh.inc" ] && source "/opt/homebrew/share/google-cloud-sdk/path.zsh.inc"
[ -f "/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc" ] && source "/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc"
autoload -Uz compinit
compinit -C
if command -v brew >/dev/null 2>&1; then
  [ -s "$(brew --prefix nvm)/nvm.sh" ] && source "$(brew --prefix nvm)/nvm.sh"
fi
