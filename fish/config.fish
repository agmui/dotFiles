if status is-interactive
    # Commands to run in interactive sessions can go here
    # set fish_greeting 
    set -U budspencer_nogreeting # removes default prompt
    set -U fish_key_bindings fish_vi_key_bindings

    # Budspencer theme setup
    set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
    set -gx PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
    # remove some cmd from history
    set -U budspencer_nocmdhist c d ll ls m s

    ### ALIASES ###
    alias v="nvim"
    alias ..="cd .."
    alias ...="cd ../.."
    alias cat="bat"
end
