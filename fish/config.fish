if status is-interactive
    # Commands to run in interactive sessions can go here
    eval "$(starship init fish)"
    cat ~/.cache/wal/sequences
    PF_INFO="ascii title os kernel uptime pkgs memory" pfetch
    pywalfox update 2> /dev/null & && disown
end
alias hx=helix
set fish_greeting
alias ls='eza --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
