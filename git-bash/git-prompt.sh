# /etc/profile.d/git-prompt.sh

if test -f /etc/profile.d/git-sdk.sh; then
	TITLEPREFIX=SDK-${MSYSTEM#MINGW}
else
	TITLEPREFIX=$MSYSTEM
fi

if test -f ~/.config/git/git-prompt.sh; then
	. ~/.config/git/git-prompt.sh
else
	if test -z "$WINELOADERNOEXEC"; then
		GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
		COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
		COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
		COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
		if test -f "$COMPLETION_PATH/git-prompt.sh"; then
			. "$COMPLETION_PATH/git-completion.bash"
			. "$COMPLETION_PATH/git-prompt.sh"
		fi
	fi

	PS1='\n\[\033[1;30m\][\@]\[\033[31m\]`__git_ps1`' # time and git branch
	PS1="$PS1"'\n\[\033[1;32m\]\w'                    # current path
	PS1="$PS1"'\n\[\033[1;31m\]$ \[\033[00m\]'        # input
fi

MSYS2_PS1="$PS1" # for detection by MSYS2 SDK's bash.basrc

# Evaluate all user-specific Bash completion scripts (if any)
if test -z "$WINELOADERNOEXEC"; then
	for c in "$HOME"/bash_completion.d/*.bash; do
		# Handle absence of any scripts (or the folder) gracefully
		test ! -f "$c" ||
			. "$c"
	done
fi
