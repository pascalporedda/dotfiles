# if [ "$TERM" = "xterm-256color" ]; then
#     if [[ -z "$TMUX" ]] ;then
#         ID="$( tmux ls | grep -vm1 attached | cut -d: -f1 )" # get the id of a deattached session
#         if [[ -z "$ID" ]] ;then # if not available create a new one
#             tmux new-session -s main
#         else
#             tmux attach-session -t "$ID" # if available attach to it
#         fi
#     fi
# fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH="/opt/homebrew/Cellar/libpq/14.2/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export NVM_LAZY_LOAD=false
export GPG_TTY=$(tty)

export ZSH="$HOME/.oh-my-zsh"

export UPDATE_ZSH_DAYS=7
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export SSH_KEY_PATH="~/.ssh/id_ed25519"

ZSH_THEME="powerlevel10k/powerlevel10k"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git zsh-autosuggestions zsh-nvm 1password docker-compose tmuxinator)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

# aliases
alias showall="defaults write com.apple.finder AppleShowAllFiles YES"
alias hideall="defaults write com.apple.finder AppleShowAllFiles NO"
alias vim="nvim"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias envim='nvim ~/.config/nvim/'
alias ytdl-audio="youtube-dl -o '$HOME/YouTube Music/%(title)s.%(ext)s' --audio-format mp3 --extract-audio --audio-quality 0"
alias open-cloud="cd '/Users/pascal/Library/Mobile Documents/com~apple~CloudDocs'"
alias notes="open-cloud && cd MDNotes && vim ."
alias sesh="tmux new-session -s main"
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export OPENSSL_ROOT_DIR=/usr/local/opt/openssl@1.1
export OPENSSL_LIBRARIES=/usr/local/opt/openssl@1.1/lib


export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo

# eval "$(pyenv init -)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"

export LD_LIBRARY_PATH=/opt/homebrew/opt/ghostscript/lib:$LD_LIBRARY_PATH

# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init --path)"
#   eval "$(pyenv init -)"
#   eval "$(pyenv virtualenv-init -)"
# fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
export SKIP_LINTING=1
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
