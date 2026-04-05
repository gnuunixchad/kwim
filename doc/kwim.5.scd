KWIM(5) "kwim" "kwm's input manager"

# NAME

kwim - kwm input manager for River Wayland compositor

# DESCRIPTION

By default, kwim reads input rules from the same configuration file used by
_kwm_, in the following paths:

	$XDG_CONFIG_HOME/kwm/config.zon

	$HOME/.config/kwm/config.zon

When user configuration doesn't exists, kwim will try to use the compile time
configuration.


# CONFIGURATION

## input-device rules

```
.{
    // full scheme:
    //      name: rule pattern
    //
    //      repeat_info: .{ .rate = i32, .delay = i32 }
    //      scroll_factor: f64
	.input_device_rules = . {
		.{ .repeat_info = .{ .rate = 30, .delay = 200 } },
	},
}
```

## libinput-device rules

```
.{
    // full scheme:
    //      name: rule pattern
    //
    //      send_events_modes:
    //          .enabled
    //          .disabled
    //          .disabled_on_external_mouse
    //      tap: .enabled or .disabled
    //      drag: .enabled or .disabled
    //      drag_lock: .enabled or .disabled
    //      tap_button_map: .lrm or .lmr
    //      three_finger_drag:
    //          .disabled
    //          .enabled_3fg
    //          .enabled_4fg
    //      calibration_matrix: [6]f32
    //      accel_profile:
    //          .none
    //          .flat
    //          .adaptive
    //          .custom
    //      accel_speed: f32
    //      natural_scroll: .enabled or .disabled
    //      left_handed: .enabled or .disabled
    //      click_method:
    //          .none
    //          .button_areas
    //          .clickfinger
    //      clickfinger_button_map: .lrm or .lmr
    //      middle_button_emulation: .enabled or .disabled
    //      scroll_method:
    //          .no_scroll
    //          .two_finger
    //          .edge
    //          .on_button_down
    //      scroll_button:
    //          .left
    //          .right
    //          .middle
    //      scroll_button_lock: .enabled or .disabled
    //      disable_while_typing: .enabled or .disabled
    //      disable_while_trackpointing: .enabled or .disabled
    //      rotation_angle: u32
    .libinput_device_rules = .{
        .{ .name = .{ .str = ".*[tT]ouchpad", .regex = true }, .tap = .enabled, .drag = .enabled, .natural_scroll = .enabled },
        .{ .tap = .enabled, .drag = .enabled }
    },
}
```

## xkb_keyboard rules

```
{
    // full scheme:
    //      name: rule pattern
    //
    //      numlock: .enabled or .disabled
    //      capslock: .enabled or .disabled
    //      layout:
    //          layout index: .{ .index = u32 }
    //          or
    //          layout name: .{ .name = "layout name" }
    //      keymap:
    //          .{ .file = .{ .path = "keymap file path", .format = .text_v1 or .text_v2 } }
    //          or
    //          .{
    //              .options = .{
    //                  .rules = ?[]const u8,
    //                  .model = ?[]const u8,
    //                  .layout = ?[]const u8,
    //                  .variant = ?[]const u8,
    //                  .options = ?[]const u8,
    //              }
    //          }
    .xkb_keyboard_rules = .{
        //
    },
}
```


# SEE ALSO

_kwim_(1), _kwm_(1), _river_(1)

Default configuration for *kwm*:

	https://github.com/kewuaa/kwm/blob/master/config.def.zon

# BUGS

https://github.com/kewuaa/kwim/issues
