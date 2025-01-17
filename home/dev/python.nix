{ pkgs, ... }: {
  home.packages = with pkgs; [
    (python3.withPackages (python-pkgs: with python-pkgs; [
      requests
      ipython
      pwntools
      pycryptodome
      tqdm
    ]))
    pipenv
  ];
}
