#compdef kwim

_kwim() {
    local line state context curcontext="$curcontext"
    local -a subcommands devices options

    options=(
        '(-h --help)'{-h,--help}'[Print help message and exit]'
        '(-v --version)'{-v,--version}'[Print version and exit]'
        '(-c --config)'{-c,--config}'[Specify the configuration file path]:config file:_files'
    )

    subcommands=(
        'list:List available devices'
        'apply:Apply configuration to a device'
    )

    devices=(
        'input-device:Standard input device'
        'libinput-device:Libinput managed device'
        'xkb-keyboard:XKB keyboard device'
    )

    _arguments -s -C \
        $options \
        '1:subcommand:->cmds' \
        '2:device type:->args' \
        '*: : ' && return 0

    case "$state" in
        cmds)
            _describe 'subcommand' subcommands
            ;;
        args)
            case $words[2] in
                list|apply)
                    _describe 'device type' devices
                    ;;
            esac
            ;;
    esac
}
