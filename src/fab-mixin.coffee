module.exports =
  _name: "c-fab"
  _v: 1
  mixins: [
    require "ceri/lib/for"
    require "ceri/lib/structure"
  ]

  _elLookup:
    cFab: (name) ->
      container = @el "div", {"class":{":":"fabClasses.fab"}}, [anchor = document.createComment("c-for")]
      @$nextTick ->
        scopes = @$for 
          names: ["_action","_index"]
          anchor: anchor
          value: ->
            result = []
            for k,v of @fab
              if not v.if? or v.if.call(@)
                v.name ?= k
                result.push v
            return result
          computed:
            _classes: ->
              classes = [@fabClasses.button]
              classes.push @fabClasses.mainButton if @_index == 0
              name = @_action.name+"Button" if @_action
              classes.push tmp if (tmp = @classes?[name])?
              return classes.join(" ")
          template: template(1,"""
            <a style="position:relative" :class=_classes @click.dyn=_action.onClick>
              <ceri-icon :name.expr="@icon[@_action.name]"></ceri-icon>
              <c-mount template=_action.child></c-mount>
            </a>
            <ceri-tooltip :class=fabClasses.tooltip :text.expr="@text[@_action.name]" anchor=w></ceri-tooltip>
          """)
      return container
  