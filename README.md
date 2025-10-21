# ⚠️ WORK IN PROGRESS ⚠️

My personal NixOS configuration files for my desktop setup using Hyprland.

## System Overview

- **Window Manager:** Hyprland
- **Display Manager:** Ly
- **Terminal:** Kitty
- **File Manager:** Dolphin
- **Browser:** Firefox
- **Application Launcher:** Wofi
- **Status Bar:** Waybar

## Structure

```
nixos/
├── flake.nix         # Main flake configuration
├── flake.lock        # Lock file for dependencies
├── hosts/           
│   └── danilo/       # Host-specific configuration
├── modules/
│   ├── nixos/       # System-wide
│   │
│   └── home-manager/ # User-specific
```

## Features

- Wayland-based desktop with Hyprland
- Pipewire audio setup
- Gaming support (Steam, Lutris, Bottles)
- Firefox with custom configuration and extensions
- AMD GPU drivers
- Brazilian Portuguese localization

## Installation

1. Clone this repository:
```bash
git clone https://github.com/yourusername/nixos.git
```

2. Copy your hardware configuration:
```bash
sudo nixos-generate-config --show-hardware-config > hosts/danilo/hardware-configuration.nix
```

3. Build and switch to the configuration:
```bash
sudo nixos-rebuild switch --flake .#danilo
```

## User Configuration

The configuration includes a Home Manager setup for the user 'danilo' with:
- Firefox customization
- Hyprland configuration
- Git settings

## License

Feel free to use this configuration as inspiration for your own NixOS setup.
