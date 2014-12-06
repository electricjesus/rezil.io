app.controller "NavigatorCtrl",[
  "$scope"
  "$location"
  ($s,$l)->
    
    # hide/show MenuBar depending on URL
    $s.$on "$routeChangeSuccess", ->
      path = $l.path()
      $s.show = true
      idx = path.indexOf "login"
      $s.show = false if idx > -1
    return
]