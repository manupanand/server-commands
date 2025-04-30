export PS1="\[\e[1;31m\]\u\[\e[0m\]@\[\e[1;34m\]CustomName\[\e[0m\] \w \$ "


---
 #Add git branch if its present to PS1

parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi


# Function to show current Git branch in parentheses rhel
parse_git_branch() {
  git rev-parse --abbrev-ref HEAD 2>/dev/null | sed 's/.*/(\0)/'
}

# PS1 with user@rhel_server, current directory, and Git branch
export PS1="\[\e[1;31m\]\u\[\e[0m\]@\[\e[1;34m\]rhel_server\[\e[0m\] \w \[\e[1;33m\]\$(parse_git_branch)\[\e[0m\] \$ "
