{ lib, ... }:

let
  lang = icon: color: {
    symbol = icon;
    format = "[$symbol ](${color})";
  };
in {
  programs.starship = {
    enable = true;
    # settings = {
    #   add_newline = true;
    #   command_timeout = 1000;

    #   format = ''
    #     [╭╴](238)$env_var\
    #     $all[╰─](238)$character
    #   '';

    #   [character]
    #   success_symbol = "[](238)";
    #   error_symbol = "[](238)";

    #   [env_var.STARSHIP_DISTRO]
    #   format = '[$env_value](bold white) ';
    #   variable = "STARSHIP_DISTRO";
    #   disabled = false;

    #   [username]
    #   style_user = "white bold";
    #   style_root = "black bold";
    #   format = "[$user]($style) ";
    #   disabled = false;
    #   show_always = true;

    #   [directory]
    #   truncation_length = 3;
    #   truncation_symbol = "…/";
    #   home_symbol = " ~";
    #   read_only_style = "197";
    #   read_only = "  ";
    #   format = "at [$path]($style)[$read_only]($read_only_style) ";

    #   [git_branch]
    #   symbol = " ";
    #   format = "on [$symbol$branch]($style) ";
    #   truncation_length = 20;
    #   truncation_symbol = "…/";
    #   style = "bold green";

    #   [git_status]
    #   format = '[\($all_status$ahead_behind\)]($style) ';
    #   style = "bold green";
    #   conflicted = "🏳";
    #   up_to_date = " ";
    #   untracked = " ";
    #   ahead = "⇡${count}";
    #   diverged = "⇕⇡${ahead_count}⇣${behind_count}";
    #   behind = "⇣${count}";
    #   stashed = " ";
    #   modified = " ";
    #   staged = '[++\($count\)](green)';
    #   renamed = "襁 ";
    #   deleted = " ";

    #   [aws]
    #   symbol = "  ";

    #   [buf]
    #   symbol = " ";

    #   [c]
    #   symbol = " ";

    #   [conda]
    #   symbol = " ";

    #   [dart]
    #   symbol = " ";

    #   [directory]
    #   read_only = " 󰌾";

    #   [docker_context]
    #   symbol = " ";

    #   [elixir]
    #   symbol = " ";

    #   [elm]
    #   symbol = " ";

    #   [fossil_branch]
    #   symbol = " ";

    #   [git_branch]
    #   symbol = " ";

    #   [golang]
    #   symbol = " ";

    #   [guix_shell]
    #   symbol = " ";

    #   [haskell]
    #   symbol = " ";

    #   [haxe]
    #   symbol = " ";

    #   [hg_branch]
    #   symbol = " ";

    #   [hostname]
    #   ssh_symbol = " ";

    #   [java]
    #   symbol = " ";

    #   [julia]
    #   symbol = " ";

    #   [lua]
    #   symbol = " ";

    #   [memory_usage]
    #   symbol = "󰍛 ";

    #   [meson]
    #   symbol = "󰔷 ";

    #   [nim]
    #   symbol = "󰆥 ";

    #   [nix_shell]
    #   symbol = " ";

    #   [nodejs]
    #   symbol = " ";

    #   [os.symbols]
    #   Alpaquita = " ";
    #   Alpine = " ";
    #   Amazon = " ";
    #   Android = " ";
    #   Arch = " ";
    #   Artix = " ";
    #   CentOS = " ";
    #   Debian = " ";
    #   DragonFly = " ";
    #   Emscripten = " ";
    #   EndeavourOS = " ";
    #   Fedora = " ";
    #   FreeBSD = " ";
    #   Garuda = "󰛓 ";
    #   Gentoo = " ";
    #   HardenedBSD = "󰞌 ";
    #   Illumos = "󰈸 ";
    #   Linux = " ";
    #   Mabox = " ";
    #   Macos = " ";
    #   Manjaro = " ";
    #   Mariner = " ";
    #   MidnightBSD = " ";
    #   Mint = " ";
    #   NetBSD = " ";
    #   NixOS = " ";
    #   OpenBSD = "󰈺 ";
    #   openSUSE = " ";
    #   OracleLinux = "󰌷 ";
    #   Pop = " ";
    #   Raspbian = " ";
    #   Redhat = " ";
    #   RedHatEnterprise = " ";
    #   Redox = "󰀘 ";
    #   Solus = "󰠳 ";
    #   SUSE = " ";
    #   Ubuntu = " ";
    #   Unknown = " ";
    #   Windows = "󰍲 ";

    #   [package]
    #   symbol = "󰏗 ";

    #   [pijul_channel]
    #   symbol = " ";

    #   [python]
    #   symbol = " ";

    #   [rlang]
    #   symbol = "󰟔 ";

    #   [ruby]
    #   symbol = " ";

    #   [rust]
    #   symbol = " ";

    #   [scala]
    #   symbol = " ";
    # };
  };
}
