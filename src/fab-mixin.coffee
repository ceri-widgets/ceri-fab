{ isArray, isFunction, capitalize,merge} = require("ceri/lib/_helpers")
anyValue = (arr) ->
  process = (val) =>
    val = @$path.resolveValue(val)
    val = val.call(@) if isFunction(val)
    return val
  if isArray(arr)
    for val in arr
      val = @$path.resolveValue(val)
      val = val.call(@) if isFunction(val)
      return true if process(val)
  else
    return process(arr)
  return false
module.exports =
  _name: "c-fab"
  _v: 1
  mixins: [
    require "ceri/lib/for"
    require "ceri/lib/structure"
    require "ceri/lib/c-mount"
  ]

  _elLookup:
    cFab: ->
      container = @el "div", {"class":{":":"fabClasses.fab"}}, [anchor = document.createComment("c-for")]
      state = (k = Object.keys(@fab)).length == 1 and @[(k = k[0])]? and k
      @$nextTick ->
        scopes = @$for 
          names: ["_action","_index"]
          anchor: anchor
          value: ->
            result = []
            addState = (k, v) ->
              merge v, name: k, child: null, onClick: null
              result.push v 
            if state
              for k,v of @fab[state]
                if @[state]["can"+capitalize(k)]
                  v.onClick = "#{state}('#{k}',null)"
                  addState(k,v)
            else
              for k,v of @fab
                if not v.if? or anyValue.call(@,v.if)
                  addState(k,v)
            return result
          computed:
            _classes: ->
              classes = [@fabClasses.button]
              classes.push @fabClasses.mainButton if @_index == 0
              name = @_action.name+"Button" if @_action
              classes.push tmp if (tmp = @classes?[name])?
              return classes.join(" ")
            _onClick: -> @$path.resolveValue(@_action.onClick)
          template: template(1,"""
            <a style="position:relative" :class=_classes @click=_onClick>
              <ceri-icon :name.expr="@icon[@_action.name]"></ceri-icon>
              <c-mount template=_action.child></c-mount>
            </a>
            <ceri-tooltip :class=fabClasses.tooltip :text.expr="@text[@_action.name]" anchor=w></ceri-tooltip>
          """)
      return container
  