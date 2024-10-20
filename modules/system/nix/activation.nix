{ pkgs, ...}:
{
  # Cool script 
  system.activationScripts.diff = 
    /*
    bash
    */
    ''
      if [[ -e /run/current-system ]]; then
        echo
        ${pkgs.nushell}/bin/nu -c "let diff_closure = ${pkgs.nix}/bin/nix store diff-closures /run/current-system '$systemConfig'; if \$diff_closure != \"\" {
          let table = \$diff_closure
          | lines
          | where \$it =~ KiB
          | where \$it =~ →
          | parse -r '^(?<Package>\S+): (?<Old_Version>[^,]+)(?:.*) → (?<New_Version>[^,]+)(?:.*, )(?<DiffBin>.*)$'
          | insert Diff {
            get DiffBin
            | ansi strip
            | str trim -l -c '+'
            | into filesize
          }
          | reject DiffBin
          | sort-by -r Diff; print \$table; \$table
          | math sum
        }"
      fi
    '';
}
