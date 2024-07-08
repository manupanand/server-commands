# Define color and style variables
USER_COLOR="\[\033[1;31m\]"  # Bold red for username
SYSTEM_COLOR="\[\033[1;33m\]"  # Bold yellow for systeminfo
RESET_COLOR="\[\033[0m\]"  # Reset color and style

# Define function to set the prompt with username and systeminfo colors
set_prompt() {
    local promptname="$1"
    PS1="${USER_COLOR}\u${RESET_COLOR}@${SYSTEM_COLOR}${promptname}${RESET_COLOR}:${SYSTEM_COLOR}\[\033[1;37m\]\w${RESET_COLOR} \$ "
}

# Initial prompt setting
set_prompt "$(hostname)"

# Alias for changing prompt name
alias set-prompt='set_prompt'



# source file 
```source ~/.bashrc```