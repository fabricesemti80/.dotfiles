# Notes

## Usage


## Useful commands

- check (Github) flake's metadata

```sh
nix flake metadata github:nixos/nixpkgs/nixos-unstable
Resolved URL:  github:nixos/nixpkgs/nixos-unstable
Locked URL:    github:nixos/nixpkgs/5a09cb4b393d58f9ed0d9ca1555016a8543c2ac8
Description:   A collection of packages for the Nix package manager
Path:          /nix/store/6h04ab83y72nm16hh9g3llgg0s296ynl-source
Revision:      5a09cb4b393d58f9ed0d9ca1555016a8543c2ac8
Last modified: 2023-11-24 03:00:26
```

- info about flake in the current directory

```sh
❯ nix flake metadata .
warning: Git tree '/home/fabrice/.dotfiles' is dirty
Resolved URL:  git+file:///home/fabrice/.dotfiles
Locked URL:    git+file:///home/fabrice/.dotfiles
Description:   My Awesome System Config of Doom
Path:          /nix/store/43hssls4j9bjz2p20sankbf2vn0wyp91-source
Revision:      d33ecb463a813f15e472e266a76ac54db6d88993-dirty
Last modified: 2023-11-27 08:43:18
Inputs:
├───home-manager: github:nix-community/home-manager/db1878f013b52ba5e4034db7c1b63e8d04173a86
│   └───nixpkgs follows input 'nixpkgs'
├───nixpkgs: github:nixos/nixpkgs/5a09cb4b393d58f9ed0d9ca1555016a8543c2ac8
├───sops-nix: github:Mic92/sops-nix/4be58d802693d7def8622ff34d36714f8db40371
│   ├───nixpkgs: github:NixOS/nixpkgs/0bd59c54ef06bc34eca01e37d689f5e46b3fe2f1
│   └───nixpkgs-stable: github:NixOS/nixpkgs/dfb95385d21475da10b63da74ae96d89ab352431
└───vscode-server: github:nix-community/nixos-vscode-server/1e1358493df6529d4c7bc4cc3066f76fd16d4ae6
    ├───flake-utils: github:numtide/flake-utils/cfacdce06f30d2b68473a46042957675eebb3401
    │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e
    └───nixpkgs: github:NixOS/nixpkgs/fd901ef4bf93499374c5af385b2943f5801c0833
```