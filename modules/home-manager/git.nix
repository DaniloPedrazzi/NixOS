{ inputs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Danilo Pedrazzi";
      user.email = "danilo.justino1@gmail.com";
    };
  };
}