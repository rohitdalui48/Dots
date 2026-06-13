# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# Oh My Zsh 
export ZSH="$HOME/.oh-my-zsh"

#theme
ZSH_THEME="bira"

# Settings
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13
export LANG=en_US.UTF-8

#plugins
plugins=(git vi-mode)
source $ZSH/oh-my-zsh.sh

# User plugin configuration
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true


# Preferred editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi
# Preferred terminal

#Paths
export PATH="$PATH:/home/daluirohit48/.local/bin"
export PATH="$PATH:/home/daluirohit48/.cargo/bin"

#zoxide
eval "$(zoxide init zsh)"

#exe
alias ls="eza --icons --color=auto"
alias ll="eza -la --icons --git --color=auto"
alias lt="eza --tree --icons --color=auto --level=2"
