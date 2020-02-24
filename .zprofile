
rt PATH="~/.rbenv/shims:/usr/local/bin:$PATH"
eval "$(rbenv init -)"

export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="$PATH:`yarn global bin`"
