require "./materialize.config.scss"

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
    
    upload:
      onClick: -> console.log "test"
    delete:
      if: -> @open
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
