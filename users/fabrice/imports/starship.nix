{ lib, ... }:

let
  lang = icon: color: {
    symbol = icon;
    format = "[$symbol ](${color})";
  };
in
{
  programs.starship = {
    enable = true;
    # settings = {
    #   add_newline = false;

    #   format = lib.strings.concatStrings [
    #     "[](#9A348E)"
    #     "$os"
    #     "$username"
    #     "[](bg:#DA627D fg:#9A348E)"
    #     "$directory"
    #     "[](fg:#DA627D bg:#FCA17D)"
    #     "$git_branch $git_status"
    #     "[](fg:#FCA17D bg:#86BBD8)"
    #     "$c $elixir $elm $golang $gradle $haskell $java $julia $nodejs $nim $rust $scala"
    #     "[](fg:#86BBD8 bg:#06969A)"
    #     "$docker_context"
    #     "[](fg:#06969A bg:#33658A)"
    #     "$time"
    #     "[ ](fg:#33658A)"
    #   ];

    #   username = {
    #     show_always = true;
    #     style_user = "bg:#9A348E";
    #     style_root = "bg:#9A348E";
    #     format = "[ $user ]($style)";
    #     disabled = false;
    #   };

    #   os = {
    #     style = "bg:#9A348E";
    #     disabled = true; # Disabled by default
    #   };

    #   directory = {
    #     style = "bg:#DA627D";
    #     format = "[ $path ]($style)";
    #     truncation_length = 3;
    #     truncation_symbol = "…/";
    #   };

    #   directory.substitutions = {
    #     "Documents" = "󰈙 ";
    #     "Downloads" = " ";
    #     "Music" = " ";
    #     "Pictures" = " ";
    #   };

    #   c = lang " " "bg:#86BBD8";
    #   docker_context = {
    #     symbol = " ";
    #     style = "bg:#06969A";
    #     format = "[ $symbol $context ]($style) $path";
    #   };
    #   elixir = lang " " "bg:#86BBD8";
    #   elm = lang " " "bg:#86BBD8";
    #   git_branch = {
    #     symbol = "";
    #     style = "bg:#FCA17D";
    #     format = "[ $symbol $branch ]($style)";
    #   };
    #   git_status = {
    #     style = "bg:#FCA17D";
    #     format = "[ $all_status$ahead_behind ]($style)";
    #   };
    #   golang = lang " " "bg:#86BBD8";
    #   gradle = {
    #     style = "bg:#86BBD8";
    #     format = "[ $symbol ($version) ]($style)";
    #   };
    #   haskell = lang " " "bg:#86BBD8";
    #   java = lang " " "bg:#86BBD8";
    #   julia = lang " " "bg:#86BBD8";
    #   nodejs = lang "" "bg:#86BBD8";
    #   nim = lang "󰆥 " "bg:#86BBD8";
    #   rust = lang "" "bg:#86BBD8";
    #   scala = lang " " "bg:#86BBD8";
    #   time = {
    #     disabled = false;
    #     time_format = "%R"; # Hour:Minute Format
    #     style = "bg:#33658A";
    #     format = "[ ♥ $time ]($style)";
    #   };
    # };
  };
}
