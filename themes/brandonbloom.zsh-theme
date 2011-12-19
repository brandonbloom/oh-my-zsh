local default_user_name='brandon'

local prompt_user="%{$fg[red]%}%n%{$reset_color%}"
local prompt_host="%{$fg[green]%}%m%{$reset_color%}"
local prompt_dir="%{$fg[blue]%}%~%{$reset_color%}"

if [[ -z $SSH_CONNECTION ]] {
    if [[ $USER == $default_user_name ]] {
        PROMPT=""
    } else {
        PROMPT="${prompt_user} %B@:%b "
    }
} else {
    if [[ $USER == $default_user_name ]] {
        PROMPT="${prompt_host} %B:%b "
    } else {
        PROMPT="${prompt_user} %B@%b ${prompt_host} %B:%b "
    }
}

PROMPT="${PROMPT}${prompt_dir} \$(git_prompt_info)%B$%b "
RPROMPT=''

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%} "
