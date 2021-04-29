##############
# Completion #
##############

unsetopt beep
unsetopt hist_beep
unsetopt list_beep
unsetopt list_ambiguous

setopt PROMPT_SUBST
setopt extendedglob
setopt inc_append_history

###########
# History #
###########

setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_find_no_dups
