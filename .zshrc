# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=10000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mra/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

## Init antidote
if [ -d "/usr/share/zsh-antidote/" ]; then
  source '/usr/share/zsh-antidote/antidote.zsh'
else
  source ${ZDOTDIR:-~}/.antidote/antidote.zsh
fi

## Init cod
source <(cod init $$ zsh)

## mrrb custom init
antidote load $HOME/.mrrb_antidote
source ~/.mrrb_custom

## Init pyen
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## Path
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ] ;
  then PATH="$HOME/.cargo/bin:$PATH"
fi

source /usr/share/nvm/init-nvm.sh

## Atuin
export ATUIN_NOBIND="true"
eval "$(atuin init zsh)"

bindkey '^q' _atuin_search_widget
