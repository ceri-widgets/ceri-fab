require "./materialize.config.styl"

createView = require "ceri-dev-server/lib/createView"
module.exports = createView
  mixins: [
    require("../src/fab.coffee")(require("../src/materialize.coffee"))
  ]
  structure: template 1, """
    <button class="btn" @click.toggle=open>Open</button>
    <br><br><br>
    <c-fab style="border:1px solid black"></c-fab>
  """
  data: ->
    open: false
  fab:
    delete:
      if: -> @open
      onClick: -> console.log "test2"
    upload:
      onClick: -> console.log "test"
    
  icon:
    upload: "ma-file_upload"
    delete: "ma-delete_forever"
  text:
    upload: "Upload"
    delete: "Delete"
  classes:
    deleteButton: "red"
  tests: ceriFab: ->
    it "should work", =>
      should.exist(@)
