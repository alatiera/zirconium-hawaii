kind: manual

build-depends:
- freedesktop-sdk.bst:public-stacks/runtime-gnu.bst

runtime-depends:
- gamerslop/gamescope-session.bst
- gamerslop/steam.bst

sources:
- kind: git_repo
  url: github:OpenGamingCollective/gamescope-session-steam.git
  track: main
  ref: 82c45fc112775e3fa927d5c326c39b21f1761cc1

variables:
  strip-binaries: ""

config:
  install-commands:
  - mkdir -p app/bin
  - mkdir -p app/share

  - install -Dm0755 -t "%{install-root}%{bindir}" "app/bin/steam-http-loader"
  - install -Dm0755 -t "%{install-root}%{bindir}" "app/bin/steamos-select-branch"
  - install -Dm0755 -t "%{install-root}%{bindir}" "app/bin/steamos-session-select"

  - install -Dm0644 -t "%{install-root}%{datadir}/applications" "app/share/applications/steam_http_loader.desktop"
  - install -Dm0644 -t "%{install-root}%{datadir}/applications" "app/share/applications/gamescope-mimeapps.list"

  - install -Dm0755 -t "%{install-root}%{datadir}/gamescope-session-plus/sessions.d" "app/share/gamescope-session-plus/sessions.d/steam"
  - install -Dm0644 -t "%{install-root}%{datadir}/polkit-1/actions" "app/share/polkit-1/actions/org.chimeraos.update.policy"

  - install -Dm0644 -t "%{install-root}%{datadir}/wayland-sessions" "app/share/wayland-sessions/gamescope-session-steam.desktop"
  - |
    %{install-extra}
