{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/pipewire.nix
    ../../modules/nixos/games.nix
    inputs.home-manager.nixosModules.default
  ];


  # ---------------- ENVIRONMENT ----------------
  # Window Manager (Hyprland)
  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  # Ly Login Manager
  services.displayManager.ly.enable = true;


  # ---------------- PACKAGES ----------------
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # System tools
    pkgs.kitty # Terminal
    kdePackages.dolphin # File Manager
    pkgs.neofetch
    pkgs.htop

    # Apps
    pkgs.vscode
    pkgs.discord
    pkgs.git

    # Utils
    pkgs.ntfs3g # NTFS support

    # Hyprland tools
    pkgs.wofi # Application launcher
    pkgs.ly # Login manager
    pkgs.dunst # Notification daemon
    pkgs.hyprpolkitagent # Polkit agent
    pkgs.waybar # Status bar
    pkgs.nwg-look # GTK theme manager
    pkgs.bibata-cursors # Cursor theme
  ];


  # ---------------- USER ----------------
  # Define a user account.
  users.users.danilo = {
    isNormalUser = true;
    description = "Danilo";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  # Define home manager user
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "danilo" = import ./home.nix;
    };
  };


  # ---------------- SYSTEM ----------------
  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname
  networking.hostName = "nixos-desktop";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable Bluetooth
  hardware.bluetooth.enable = true;

  # Enable AMD Drivers
  services.xserver.videoDrivers = [ "amdgpu" ];

  # TimeZone
  time.timeZone = "America/Sao_Paulo";

  # Localization & Keymaps
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };
  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };
  console.keyMap = "br-abnt2";

  # Before changing this value read the documentation for this option (https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05";
}
