# Description

kwim is an input manager for [River] separated from [kwm], implementing the
river-input-management-v1 protocol and/or related protocols in order to
configure input devices independent of window manager.

# Dependencies

- wayland (libwayland-client)
- xkbcommon

# Build

Requires zig 0.15.x.

```sh
zig build -Doptimize=ReleaseSafe
```

- `-Dconfig`: specify config path as compile-time config
- `-Dkwm-config`: specify kwm config path as compile-time config
- `-Dbash-completion`: if to install bash completion file (defaults to `true`)
- `-Dzsh-completion`: if to install zsh completion file (defaults to `true`)
- `--prefix`: specify the path to install files

# Usage

Without any subcommands and options, kwim reads input rules from the same
configuration file used by kwm.

You can also use `-c,--config` to specify the custom configuration file path.

See `kwim(1)` man page for complete documentation.

## subcommands

- `kwim list`: list device information, `kwim list -h` to see details.
- `kwim apply`: apply a single rule for device, `kwim apply -h` to see defails.

# Configuration

See `kwim(5)` man page or kwm's [config.def.zon] for all possible settings.

## License

The source code of kwim is released under the [GPL-3.0].

[kwm]: https://github.com/kewuaa/kwm.git
[river]: https://codeberg.org/river/river
[config.def.zon]: https://github.com/kewuaa/kwm/blob/3860d2c0d7f772c030cf5b88c4d00d8d9b6c531a/config.def.zon#L1030
[GPL-3.0]: ./LICENSE
