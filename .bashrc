# ~/.bashrc

[[ $- != *i* ]] && return

# machine specific configuration
HOST=$(hostname)
if [[ "$HOST" == "calluna-desktop" ]]; then
    for file in $HOME/.bashrc.d/desktop/*; do
        if [[ -f $file ]]; then source $file; fi
    done
elif [[ "$HOST" == "verdant" ]]; then
    for file in $HOME/.bashrc.d/laptop/*; do
        if [[ -f $file ]]; then source $file; fi
    done
fi

# generic configuration
for file in $HOME/.bashrc.d/*; do
    if [[ -f $file ]]; then source $file; fi
done

# \e[1;35m <...> \e[0m
PS1=' \W/ $(__git_ps1 "(%s) ")\e[1;$([[ $? = 0 ]] && printf 35 || printf 31)m<3\e[0m '
