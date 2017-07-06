mixin = null
module.exports = (theme) ->
  unless mixin
    unless window.customElements.get("ceri-icon")
      window.customElements.define "ceri-icon", require("ceri-icon")
    unless window.customElements.get("ceri-tooltip")
      window.customElements.define "ceri-tooltip", require("ceri-tooltip")
    mixin = require "./fab-mixin"
    mixin.mixins.push theme
  return mixin

