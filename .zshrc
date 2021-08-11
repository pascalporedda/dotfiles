if [ "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ]; then
    if [[ -z "$TMUX" ]] ;then
        ID="$( tmux ls | grep -vm1 attached | cut -d: -f1 )" # get the id of a deattached session
        if [[ -z "$ID" ]] ;then # if not available create a new one
            tmux new-session
        else
            tmux attach-session -t "$ID" # if available attach to it
        fi
    fi
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:$PATH
export PATH=/usr/local/sbin:$HOME/.composer/vendor/bin:$PATH
export NVM_LAZY_LOAD=false
export GPG_TTY=$(tty)

export ZSH="$HOME/.oh-my-zsh"

export UPDATE_ZSH_DAYS=7
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export SSH_KEY_PATH="~/.ssh/id_ed25519"

ZSH_THEME="powerlevel10k/powerlevel10k"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git zsh-autosuggestions zsh-nvm)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

# aliases
alias showall="defaults write com.apple.finder AppleShowAllFiles YES"
alias hideall="defaults write com.apple.finder AppleShowAllFiles NO"
alias vim="nvim"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias envim='nvim ~/.config/nvim/init.vim'
alias ytdl-audio="youtube-dl -o '$HOME/YouTube Music/%(title)s.%(ext)s' --audio-format mp3 --extract-audio --audio-quality 0"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export OPENSSL_ROOT_DIR=/usr/local/opt/openssl@1.1
export OPENSSL_LIBRARIES=/usr/local/opt/openssl@1.1/lib
# eval "$(pyenv init -)"

export PATH=/usr/local/opt/qt5/bin:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

##----------------

# Created by `pipx` on 2021-04-06 09:14:20
export PATH="$PATH:/Users/pascal/.local/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/pascal/code/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/pascal/code/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/pascal/code/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/pascal/code/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
