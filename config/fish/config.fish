if status is-interactive
    set EDITOR "nvim"
    set TERM "kitty"

    # set fish_greeting 
    set -U fish_greeting no # removes default prompt
    set -U fish_key_bindings fish_vi_key_bindings

    ### ALIASES ###
    alias na="sudo nala install"
    alias ls="exa --icons -sold -snew"
    alias v="nvim"
    alias ..="cd .."
    alias ...="cd ../.."
    #alias cat="bat"
    alias rm="trash-rm"#http://www.webupd8.org/2010/02/make-rm-move-files-to-trash-instead-of.html
    alias ducd="du -h -a . | sort -n -r | head -n 20"
end

set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_default_branch yes
set -g theme_git_default_branches master main
#set -g theme_git_worktree_support no
set -g theme_use_abbreviated_branch_name no
set -g theme_display_vagrant yes
set -g theme_display_docker_machine yes
set -g theme_display_k8s_context yes
set -g theme_display_k8s_namespace yes
set -g theme_display_aws_vault_profile yes
set -g theme_display_hg yes
set -g theme_display_virtualenv yes
set -g theme_display_nix yes
set -g theme_display_ruby yes
set -g theme_display_node yes
set -g theme_display_vi yes
set -g theme_display_date no
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
set -g theme_title_display_path yes
# set -g theme_display_user ssh
set -g theme_display_hostname ssh
set -g theme_title_display_user yes
set -g theme_title_display_sudo_user yes
set -g theme_title_use_abbreviated_path no
set -g theme_date_format "+%a %H:%M"
set -g theme_date_timezone America/Los_Angeles
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g theme_display_jobs_verbose yes
set -g default_user your_normal_user
set -g theme_color_scheme nord
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 1
set -g theme_newline_cursor yes
set -g theme_newline_prompt '\e[32m❯ \e[0m'

set -x MANPAGER "sh -c 'col -bx | batcat -l man -p'"

set -x PICO_SDK_PATH /home/agmui/cs/pico/pico-sdk
set -x PICO_EXAMPLES_PATH /home/agmui/cs/pico/pico-examples
set -x PICO_EXTRAS_PATH /home/agmui/cs/pico/pico-extras
set -x PICO_PLAYGROUND_PATH /home/agmui/cs/pico/pico-playground

set -x WOKWI_CLI_TOKEN wok_3i77mFwBNeaARjaAg6OinU2QuzJcWXDNebf28143

#set -x GOPATH /home/agmui/go
#set -Ua fish_user_paths /usr/local/go/bin
#set -Ua fish_user_paths $GOPATH/bin

#how to add to PATH
#set -x fish_user_paths /home/agmui/cs/Robomasters/tools/gcc-arm-none-eabi-10.3-2021.10/bin


#source /home/agmui/miniconda3/etc/fish/conf.d/conda.fish
#set _CONDA_ROOT "/home/agmui/miniconda3"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/agmui/miniconda3/bin/conda
    eval /home/agmui/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

