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
    settings = {
      add_newline = true;
      format = lib.strings.concatStrings [
        "$nix_shell"
        "$os"
        "$directory"
        "$container"
        "$git_branch $git_status"
        "$c"
        "$dotnet"
        "$elixir"
        "$elm"
        "$golang"
        "$haskell"
        "$java"
        "$julia"
        "$nodejs"
        "$nim"
        "$rust"
        "\n$character"
      ];
      status = {
        symbol = "✗";
        not_found_symbol = "󰍉 Not Found";
        not_executable_symbol = " Can't Execute E";
        sigint_symbol = "󰂭 ";
        signal_symbol = "󱑽 ";
        success_symbol = "";
        format = "[$symbol](fg:red)";
        map_symbol = true;
        disabled = false;
      };
      cmd_duration = {
        min_time = 1000;
        format = "[$duration ](fg:yellow)";
      };
      character = {
        success_symbol = "[](fg:green bg:#86BBD8)";
        error_symbol = "[✘](fg:red bg:#86BBD8)";
      };
      nix_shell = {
        disabled = false;
        format = "[ ](fg:#33658A bg:#86BBD8)";
      };
      container = {
        symbol = " 󰏖";
        format = "[$symbol ](yellow dimmed)";
      };
      directory = {
        format = " [](fg:#D8BB86)[$path](bg:#D8BB86 fg:#000000)[](fg:#D8BB86)";
        truncation_length = 4;
        truncation_symbol = "~/…/";
      };
      directory.substitutions = {
        "Documents" = "Doc ";
        "Downloads" = " ";
        "Music" = " ";
        "Pictures" = " ";
        "Projects" = "󱌢 ";
        "School" = "󰑴 ";
        "GitHub" = "";
        ".config" = " ";
        "Vault" = "󱉽 ";
      };
      git_branch = {
        symbol = "☊";
        style = "";
        format = "[ $symbol $branch](fg:#000000 bg:#FCA17D)";
      };
      os = {
        disabled = false;
        format = "[ $symbol]($style)";
      };
      os.symbols = {
        Mint = "";
        Windows = "";
      };
      python = lang "" "fg:#33658A bg:#86BBD8";
      nodejs = lang "󰎙 " "fg:#33658A bg:#86BBD8";
      lua = lang "" "fg:#33658A bg:#86BBD8";
      rust = lang "🦀" "fg:#33658A bg:#86BBD8";
      java = lang "☕" "fg:#33658A bg:#86BBD8";
      c = lang "" "fg:#33658A bg:#86BBD8";
      golang = lang "🐹" "fg:#33658A bg:#86BBD8";
    };
  };
}
