# TERMINAL PROMPT
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
# This line obtains information from the vcs.
zstyle ':vcs_info:git*' formats "%b"
precmd() {
    vcs_info
}
setopt prompt_subst
prompt='%F{yellow}%2/ %F{magenta}${vcs_info_msg_0_} %F{white}$ '

# ALIASES
alias g="git"
alias ls="ls -la"
alias rm="rm -i"
alias tf="terraform"
alias dc="docker compose"

# FUNCTIONS
function pr() {
  github_url=`git remote -v | awk '/fetch/{print $2}' | sed -Ee 's#(git@|git://)#https://#' -e 's@com:@com/@' -e 's%\.git$%%' | awk '/github/'`;
  branch_name=`git symbolic-ref HEAD | cut -d"/" -f 3,4`;
  pr_url=$github_url"/compare/main..."$branch_name
  open $pr_url;
}
