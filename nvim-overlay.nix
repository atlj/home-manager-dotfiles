# https://github.com/Dlurak/Dotfiles/blob/56d88d01f5ba6a723146ef7650460e376679ff1e/flake/nixOsModules/overlays/neovim.nix
final: prev:
let
  neovimDeps = with final; [
    # silicon # For :Silicon
    # gcc # For treesitter
    # # Formatting
    # nixfmt
    # # Language Servers
    # bash-language-server
    # emmet-ls
    # gopls
    # vscode-langservers-extracted
    # lua-language-server
    # nixd
    rust-analyzer
    # nodePackages_latest.svelte-language-server
    # tinymist
    # nodePackages.typescript-language-server
  ];
  neovimDepsPaths = map (p: "${p}/bin") neovimDeps;
in
{
  neovim-unwrapped = prev.neovim-unwrapped.overrideAttrs (old: {
    version = "0.12.0-dev";
    src = final.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "1a02896e169b7e22c489dd5b7f60b570c496631e";
      hash = "sha256-Jq9QA4Xv+JHZ9FxS/F5RZDrMCYx8DnsnZrZVtHWPkwU=";
    };
  });
  neovim = prev.neovim.overrideAttrs (old: {
    nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ prev.buildPackages.makeWrapper ];
    postInstall =
      let
        paths = builtins.concatStringsSep ":" neovimDepsPaths;
      in
      ''
        wrapProgram $out/bin/nvim \
          --prefix PATH : "${paths}"
      '';
  });
}
