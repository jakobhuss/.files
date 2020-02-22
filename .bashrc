if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PATH="$HOME/.cargo/bin:$PATH"

if [ -f ~/.aliases ]; then
	. ~/.aliases
fi

if [ -x $(command -v setxkbmap > /dev/null) ]; then
  setxkbmap -layout se
  setxkbmap -option caps:escape
fi
