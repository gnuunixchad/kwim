# Description

kwim is an input manager for [River] separated from [kwm], implementing the
river-input-management-v1 protocol and/or related protocols in order to
configure input devices independent of window manager.

## Dependencies

- wayland (libwayland-client)
- xkbcommon

## Build

Requires zig 0.15.x.

```sh
zig build -Doptimize=ReleaseSafe
```

- `-Dllvm`: force using LLVM compiler and linker
- `-Dconfig`: specify config path as compile-time config
- `-Dkwm-config`: specify kwm config path as compile-time config
- `-Dbash-completion`: if to install bash completion file (defaults to `true`)
- `-Dzsh-completion`: if to install zsh completion file (defaults to `true`)

## Installation

<a href="https://repology.org/project/kwim/versions">
  <img align="right" width="192" src="https://repology.org/badge/vertical-allrepos/kwim.svg">
</a>

```sh
zig build install -Doptimize=ReleaseSafe
```

- `--prefix`: specify the path to install files

## Usage

Without any subcommands and options, kwim reads input rules from the following paths:
- `$XDG_CONFIG_HOME/kwim/config.zon`
- `$HOME/.config/kwim/config.zon`

You can also use `-c,--config` to specify the custom configuration file path.

[config.def.zon] is a example configuration file.
`kwm` users could still put the input rules in `kwm`'s configuration file.
`kwm` built with `-Dkwim` will pass the `kwm` configuration path to `kwim` by `-c`.

See `kwim(1)` man page for complete documentation.

### subcommands

- `kwim list`: list device information, `kwim list -h` to see details.
- `kwim apply`: apply a single rule for device, `kwim apply -h` to see defails.

## Configuration

See `kwim(5)` man page or [config.def.zon] for all possible settings.

## License

The source code of kwim is released under the [GPL-3.0].

[kwm]: https://github.com/kewuaa/kwm.git
[river]: https://codeberg.org/river/river
[config.def.zon]: ./config.def.zon
[GPL-3.0]: ./LICENSE
