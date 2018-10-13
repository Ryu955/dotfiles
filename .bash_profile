export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export XDG_CONFIG_HOME="$HOME/.config"
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
