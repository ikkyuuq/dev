source ~/.config/fish/alias.fish
source ~/.config/fish/functions/arduino-comp.fish

set -U STARSHIP_CONFIG $XDG_CONFIG_HOME/starship.toml
set -U fish_greeting
set -U fish_user_paths ~/.local/scripts $fish_user_paths
set -gx EDITOR nvim
set -gx WOKWI_CLI_TOKEN wok_C6QUuKHVwOjBgvN81xuJdU9lG0sQjNbY66e61bfa

fish_vi_key_bindings --no-erase default

if test -z (pgrep ssh-agent)
    eval (ssh-agent -c)
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end

bind \cf tmux-sessionizer

# Load all saved ssh keys
# /usr/bin/ssh-add -A ^/dev/null
#
# Fish syntax highlighting
set -g fish_color_autosuggestion 555 brblack
set -g fish_color_cancel -r
set -g fish_color_command --bold
set -g fish_color_comment red
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end brmagenta
set -g fish_color_error brred
set -g fish_color_escape bryellow --bold
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator bryellow
set -g fish_color_param cyan
set -g fish_color_quote yellow
set -g fish_color_redirection brblue
set -g fish_color_search_match bryellow '--background=brblack'
set -g fish_color_selection white --bold '--background=brblack'
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline

set -Ux GEMINI_API_KEY AIzaSyB0B7jrVoHyauSmR-RgNHo23XAJqiyveX8

# Install Starship
starship init fish | source
# Install Atuin better history
atuin init fish | source

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

set _go_path "$HOME/go/bin"

if not contains $_go_path $PATH
    set -gx --prepend PATH $_go_path
end
set --erase _go_path

set -gx PATH /home/kppras/miniconda3/bin/ $PATH
