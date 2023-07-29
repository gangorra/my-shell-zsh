# Git configs
ZSH_THEME_GIT_PROMPT_PREFIX='(\ue0a0 ' 
ZSH_THEME_GIT_PROMPT_SUFFIX=')'
ZSH_THEME_GIT_PROMPT_DIRTY=''
ZSH_THEME_GIT_PROMPT_CLEAN=''

# User and hostname
user_prompt='%B%F{#7FFFD4}╭─[%n@%m]%f%b'

#Date
date='%F{#808000}[%*]%f'

#Directories
dir_prompt='%F{#E69F66}%0~%f'

#Date
date='%F{#808000}[%*]%f'

# Prompt second Line
second_line='%F{#FFA500}╰──>'

PROMPT='${user_prompt} in ${dir_prompt} - ${date}$(git_prompt_info)%f
${second_line} %f%b'

# Função git_prompt_info modificada
function git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    # Get the current branch name or commit SHA
    ref=$(command git symbolic-ref --quiet --short HEAD 2>/dev/null)
    if [[ -n $ref ]]; then
      # Set the color to #FFA500 (cor laranja) for the branch name
      local git_status="%F{#FFA500}- ${ref}%f"
    else
      # No branch, so we're in a detached HEAD state or not in a Git repository
      return  # Do not display anything if not on a branch
    fi
    echo " ${git_status}"
  fi
}