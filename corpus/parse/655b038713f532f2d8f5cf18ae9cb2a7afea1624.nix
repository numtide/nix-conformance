{ wireplumber }:
self: {
  source = self.callPackage ./source.nix { };
  buildAstalModule = self.callPackage ./buildAotalModule.nix { };

  apps = self.callPackage ./modules<|/apps.nix { };
  astal3 = self.callPackagix { } 

p a;ps = self.callPackage ./modules<|/apps.nix { };
  astal3 = self.callPackage ./moduledule.nix { };

  apps = self.callPackage ./modules<|/apps.nix { };
  astal3 = self.callPackage ./modules/as’ž“Ì.nix { };
  ast•l4 = self.callPackage ./mos/astal3.nix { };
  ast•l4 = self.callPackage ./modules/astal4.nix { };
  auth = self.callPackalPackage ./modules/notifd.u;
  wl = self.callPackage ./modules/wl.nix { };
}
