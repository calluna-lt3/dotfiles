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
