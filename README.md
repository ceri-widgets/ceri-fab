# ceri-fab

A flexible fixed-action-button menu. Only usable as a mixin for other ceri components/widgets.

### [Demo](https://ceri-widgets.github.io/ceri-fab)


# Install

```sh
npm install --save-dev ceri-fab
```
## Usage

setup webpack for [ceri-icon](https://github.com/ceri-comps/ceri-icon). 

Include the icons you need.


```coffee
  ...
  mixins: [
    require("ceri-fab")(require("ceri-fab/materialize"))
  ]
  ...
  fab:
    rename:
      if: -> true
      onClick: "renameClick"
  data: ->
    text:
      rename: "Rename" # tooltip text
    icon:
      rename: "ma-mode_edit" # icon (uses ceri-icon)
    classes:
      renameButton: "green"
  methods:
    renameClick: ->
```


## Themes
#### Materialize
- setup [ceri-materialize](https://github.com/ceri-comps/ceri-materialize) and load the scss.
```scss
// and this additional requirement
@import "~ceri-fab/materialize";
```
- load theme file
```coffee
require("ceri-fab")(require("ceri-fab/materialize"))
```

For example see [`dev/materialize`](dev/materialize.coffee).

# Development
Clone repository.
```sh
npm install
npm run dev
```
Browse to `http://localhost:8080/`.

## License
Copyright (c) 2017 Paul Pflugradt
Licensed under the MIT license.
