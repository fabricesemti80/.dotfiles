{ config, pkgs, ... }:

{
  # List packages installed in the system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  
    ### Development Tools:
    alacritty             #? (GPU-accelerated terminal emulator)
    git                   #? (Version control system)
    git-crypt             #? (Transparent file encryption in git)
    go-task               #? (Task runner / build tool)
    gnupg                 #? (GNU Privacy Guard - encryption and signing tool)
    hugo                  #? (Static site generator)
    httpie                #? (Command-line HTTP client)
    jq                    #? (Lightweight and flexible command-line JSON processor)
    neovim                #? (Text editor that seeks to improve upon Vim)
    nix-info              #? (Nix package manager information)
    nixfmt                #? (Formatter for Nix code)
    nixpkgs-fmt           #? (Formatter for Nixpkgs code)
    pinentry-qt           #? (Qt-based PIN or passphrase entry dialog for GnuPG)
    ripgrep               #? (Fast and efficient text search tool)
    sops                  #? (Simple and flexible tool for managing secrets)
    tree                  #? (Recursive directory listing command)
    tmux                  #? (Terminal multiplexer)
    wget                  #? (Command-line utility to download files from the web)

    ### Programming Language:
    go                    #? (Go programming language)

    ### Utilities:
    age                   #? (Simple, modern file encryption tool)
    bat                   #? (A cat(1) clone with syntax highlighting and Git integration)
    direnv                #? (Environment switcher for the shell)

    ### Command-line Utilities:
    btop                  #? (Resource monitor)
    cmatrix               #? (Matrix screensaver)
    cowsay                #? (Program that generates ASCII pictures of a cow with a message)
    duf                   #? (Disk usage/free utility)
    eza                   #? (Command-line utility for task automation)
    fzf                   #? (Command-line fuzzy finder)
    lolcat                #? (Colorize text in the terminal)
    man-pages             #? (Linux manual pages)
    nano                  #? (Text editor for Unix-like operating systems)
    neofetch              #? (Command-line system information tool)
    tailscale             #? (Mesh VPN service for easy and secure network access)
    dig                   #? (DNS lookup utility)
    curl                  #? (Command-line tool for making HTTP requests)
    httpie                #? (Command-line HTTP client)
    wget                  #? (Command-line utility to download files from the web)
  ];
}
