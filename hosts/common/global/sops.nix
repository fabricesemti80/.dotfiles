{ pkgs, vars, ... }:

{
  ## SOPS
  # path to the file containing secrets
  sops = {
    # relative path to secret file; NO quotes!
    defaultSopsFile = ../secrets/super_secrets.yaml;

    # path to an automatically generated (by the OS) SSH key; do this on ALL machines that need the secrets!
    # run: nix-shell -p ssh-to-age --run 'cat /etc/ssh/ssh_host_ed25519_key.pub | ssh-to-age'
    # and add the key to the .sops.yaml
    # to activate this (has to be done BEFORE the encryption!)
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

    # Auto-generate
    age.keyFile = "/var/lib/sops-nix/key.txt";
    # This will generate a new key if the key specified above does not exist
    age.generateKey = true;

    # This is the actual specification of the secrets; 'id_ed25519' MUST exist (replace if appropriate)
    secrets = {
      id_ed25519 = {
        owner = vars.user;
        # group = vars.user.group;
        path = "/home/${vars.user}/.ssh/id_ed25519";
      };
      primary_key_fs = {
        owner = vars.user;
        # group = vars.user.group;
        path = "/home/${vars.user}/.ssh/primary_key_fs";
      };
      secondary_key_fs = {
        owner = vars.user;
        # group = vars.user.group;
        path = "/home/${vars.user}/.ssh/secondary_key_fs";
      };
      private_gpg = {
        owner = vars.user;
        # group = vars.user.group;
        path = "/home/${vars.user}/.gnupg/private.gpg";
      };
      id_ed25519_pub = {
        owner = vars.user;
        # group = vars.user.group;
        path = "/home/${vars.user}/.ssh/id_ed25519.pub";
      };
      allowed_signers = {
        owner = vars.user;
        # group = vars.user.group;
        path = "/home/${vars.user}/.ssh/allowed_signers";
      };
    };

    # sops.secrets."myservice/my_subdir/my_secret" = { };
  };

}
