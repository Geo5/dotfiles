if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/georg/.ghcup/bin $PATH # ghcup-env

string match -q "$TERM_PROGRAM" "vscode"
and . (code --locate-shell-integration-path fish)
