#! /bin/sh
case "$SHELL" in
	/bin/bash) echo "You are using bash" ;;
	/bin/zsh) echo "You aare using zsh" ;;
	*) echo "Unknown shell" ;;
esac
