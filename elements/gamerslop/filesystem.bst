
kind: compose

variables:
  prefix: "/app"

build-depends:
- stacks/jackrabbit.bst
- freedesktop-sdk.bst:public-stacks/runtime-gnu.bst

config:
  exclude:
  - debug
  - devel
  - doc
  - locale
