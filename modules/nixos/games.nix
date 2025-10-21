{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        protonup # ProtonUp for managing Proton and other compatibility tools
        lutris # Lutris for Epic Games
        bottles # Bottles for 🏴‍☠️
        osu-lazer-bin # Osu!
    ];

    # Setup protonup PATH
    environment.sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/danilo/.steam/root/compatibilitytools.d";
    };

    # Steam
    programs.steam = {
        enable = true;
        gamescopeSession.enable = true;
    };

    programs.gamemode.enable = true;
}