#!/bin/sh
if test "$(which code)"; then
	if [ "$(uname -s)" = "Darwin" ]; then
		VSCODE_HOME="$HOME/Library/Application Support/Code"
	else
		VSCODE_HOME="$HOME/.config/Code"
	fi

	ln -sf "$DOTFILES/vscode/settings.json" "$VSCODE_HOME/User/settings.json"
	ln -sf "$DOTFILES/vscode/keybindings.json" "$VSCODE_HOME/User/keybindings.json"
	ln -sf "$DOTFILES/vscode/snippets" "$VSCODE_HOME/User/snippets"

	# from `code --list-extensions`
	modules="
dbaeumer.vscode-eslint
esbenp.prettier-vscode
PKief.material-icon-theme
redhat.java
Dart-Code.flutter
Borke.puppet
CoenraadS.bracket-pair-colorizer
EditorConfig.EditorConfig
PeterJausovec.vscode-docker
be5invis.toml
carolynvs.dep
esbenp.prettier-vscode
formulahendry.auto-close-tag
formulahendry.auto-rename-tag
foxundermoon.shell-format
haaaad.ansible
ipedrazas.kubernetes-snippets
lukehoban.Go
mauve.terraform
ms-python.python
patbenatar.advanced-new-file
pnp.polacode
rebornix.Ruby
rust-lang.rust
shanoor.vscode-nginx
shinnn.alex
teabyii.ayu
timonwong.shellcheck
"
	for module in $modules; do
		code --install-extension "$module" || true
	done
fi
