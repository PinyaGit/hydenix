{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.hydenix.hm.brave;
in
{
  options.hydenix.hm.brave = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.hydenix.hm.enable;
      description = "Enable Brave browser module";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      brave
    ];
  };
} 