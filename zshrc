#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source syntax-highlighting
source .zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 
# Source history-substring-search | has to be loaded after syntax-highligting
source .zsh-plugins/zsh-history-substring-search/zsh-history-substring-search.zsh  

#####
# keybinds for 'home' and 'end' keys
###
bindkey  "^[[1~"   beginning-of-line
bindkey  "^[[4~"   end-of-line
#####

######
# keybinds for history-substring-search
##
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
#####


# Customize to your needs...
unsetopt CORRECT                      # Disable autocorrect guesses. Happens when typing a wrong
                                      # command that may look like an existing one.

expand-or-complete-with-dots() {      # This bunch of code displays red dots when autocompleting
  echo -n "\e[31m......\e[0m"         # a command with the tab key, "Oh-my-zsh"-style.
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots
