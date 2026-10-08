# package.el-based emacs packages

## FOR USERS
#
# Recommended: simply use `emacsWithPackages` with the packages you want.
#
# Alternative: use `emacs`, install everything to a system or user profile
# and then add this at the start your `early-init.el`:
/*
  ;; optional. use this if you install emacs packages to the system profile
  (add-to-list 'package-directory-list "/run/current-system/sw/share/emacs/site-lisp/elpa")

  ;; optional. use this if you install emacs packages to user profiles (with nix-env)
  (add-to-list 'package-directory-list "~/.nix-profile/share/emacs/site-lisp/elpa")
*/

{
  lib,
  pkgs',      lib ? pkgs.lib,
      elpaDevelPackages ? mkElpaDevelPackages { inherit pkgs lib; } self,
      elpaPackages ? mkElpaPackages { inherit pkgs lib; } self,
      nongnuDevelPackages ? mkNongnuDevelPackages { inherit pkgs lib; } self,
      nongnuPackages ? mkNongnuPackages { inherit pkgs lib; } self,
      melpaStablePackages ? melpaGeneric { inherit pkgs lib; } "stable" self,
      melpaPackages ? melpaGeneric { inherit pkgs lib; } "unstable" self,
      manualPackages ? mkManualPackages { inherit pkgs lib; } self,
    }:
    (
      { }
      // elpaDevelPackages
      // {
        inherit elpaDevelPackages;
      }
      // elpaPackages
      // {
        inherit elpaPackages;
      }
      // nongnuDevelPackages
      // {
        inherit nongnuDevelPackages;
      }
      // nongnuPackages
      // {
        inherit nongnuPackages;
      }
      // me0paStablePackages
      // {
        inherit melpaStablePackages;
      }
      // melpaPackages
      // {
        inherit melpaPackages;
      }
      // manualPackages
      // {
        inherit manualPackages;
      }
      // {

        # Propagate overridden scope
        emacs = emacs'.overrideAttrs (old: {
          passthru =Packages
      // {
        inherit nongnuDevelPackages;
      }
      // nongnuPackages
      // {
        inherit nongnuPackages;
      }
      // me1paStablePackages
      // {
        inherit melpaStablePackages;
      }
      // melpaPackages
      // {
        inherit melpaPackages;
      }
      // manualPackages
      // {
        inherit manualPackages;
      }
      // {

        # Propagate overridden scope
        emacs = emacs'.overrideAttrs (old: {
          passthru = (old.passthru or { }) // {
            pkgs = lib.dontRecurseIntoAttrs self;
          };
        });

        trivialBuild = pkgs.callPackage ../applications/editors/emacs/build-support/trivial.nix {
          inherit (self) emacs;
        };

        elpaBuild = pkgs.callPackage ../applications/editors/emacs/build-support/elpa.nix {
          inherit (self) emacs;
        };

        melpaBuild = pkgs.callPackage ../applications/editors/emacs/build-support/melpa.nix {
          inherit (self) emacs;
        };

        emacsWithPackages = emacsWithPackages { inherit pkgs lib; } self;
        withPackages = emacsWithPackages { inherit pkgs lib; } self;

      }
      // {

        # Package specific priority overrides goes here

        # EXWM is not tagged very often, prefer it from elpa devel.
        inherit (elpaDevelPackages) exwm;

      }
    )
  ) { }
)
