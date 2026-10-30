kind: manual

build-depends:
- freedesktop-sdk.bst:public-stacks/runtime-gnu.bst

runtime-depends:
- gamerslop/gamescope.bst

sources:
- kind: git_repo
  url: github:OpenGamingCollective/gamescope-session.git
  track: main
  ref: 08e65a62ed3d7acc6ae17db637091d402a55ae2a

variables:
  prefix: "/app"
  strip-binaries: ""

config:
  install-commands:
  - mkdir -p app/bin
  - mkdir -p app/share
  - mkdir -p app/lib
  - mkdir -p app/share/gamescope/scripts/50-custom/
  - mkdir -p app/bin/export-gpu
  - mkdir -p app/bin/gamescope-session-plus
  - mkdir -p app/lib/systemd/user/

  - install -Dm0755 -t "%{install-root}%{bindir}" "app/bin/export-gpu"
  - install -Dm0755 -t "%{install-root}%{bindir}" "app/bin/gamescope-session-plus"

  - install -Dm0644 -t "%{install-root}%{indep-libdir}/systemd/user" "app/lib/systemd/user/gamescope-session-plus@.service"
  - install -Dm0644 -t "%{install-root}%{indep-libdir}/systemd/user" "app/lib/systemd/user/gamescope-session.target"

  - install -Dm0644 -t "%{install-root}%{datadir}/gamescope-session-plus" "app/share/gamescope-session-plus/device-quirks"
  - install -Dm0755 -t "%{install-root}%{datadir}/gamescope-session-plus" "app/share/gamescope-session-plus/gamescope-session-plus"

  - install -Dm0644 -t "%{install-root}%{datadir}/gamescope/scripts/50-custom/50-disable-explicit-sync.lua" "app/share/gamescope/scripts/50-custom/50-disable-explicit-sync.lua"
  - |
    %{install-extra}
