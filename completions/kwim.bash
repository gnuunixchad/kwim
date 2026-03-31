_kwim_completions() {
    local cur prev words cword
    _get_comp_words_by_ref -n : cur prev words cword

    local subcommands="list apply"
    local devices="input-device libinput-device xkb-keyboard"
    local options="-h --help -v --version -c --config"

    if [[ "$prev" == "-c" || "$prev" == "--config" ]]; then
        _filedir
        return 0
    fi

    if [[ "$cur" == -* ]]; then
        COMPREPLY=( $(compgen -W "$options" -- "$cur") )
        return 0
    fi

    case "$cword" in
        1)
            COMPREPLY=( $(compgen -W "$subcommands" -- "$cur") )
            ;;
        2)
            case "${words[1]}" in
                list|apply)
                    COMPREPLY=( $(compgen -W "$devices" -- "$cur") )
                    ;;
            esac
            ;;
        *)
            COMPREPLY=()
            ;;
    esac
}

complete -F _kwim_completions kwim
