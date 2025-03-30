# ~/.bashrc

[[ $- != *i* ]] && return

# machine specific configuration
for file in $HOME/.bashrc.d/$(hostname)/*; do
    if [[ -f $file ]]; then source $file; fi
done

# generic configuration
for file in $HOME/.bashrc.d/*; do
    if [[ -f $file ]]; then source $file; fi
done
