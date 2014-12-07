app.controller "ListCtrl",[
  "$scope"
  "$firebase"
  "$routeParams"
  "$location"
  "$mdToast"
  ($s,$fb,$rp,$l,$mdToast)->
    
    $s.LIST_ID = $rp.listId
    create = $rp.listId is "create"
    #initial $firebase to get list if has id or not if create is true
    $s.list =
      moderators:[]
    
    $s.items = [
      {
        id:1
        projectId:1
        listId: 1
        name: "Rice"
        index: 0
        goal: [
          {
            "unit":"sacks"
            "value":100
          }
        ],
        progress: 30
      }
      {
        id:2
        projectId:1
        listId: 1
        name: "Sardines Can"
        index: 1
        goal: [
          {
            "unit":"cans"
            "value":100
          }
        ],
        progress: 54
      }
    ]
    $s.move = (dir,object,list)->
      i = object.index
      id = object.id
      
      allow = false
      allow = true if dir is 'down' and i isnt 0
      allow = true if dir is 'up' and i isnt (list.length-1)
      
      if allow
        newIndex = i + (if dir is 'down' then -1 else 1)
        
        list.forEach (item)->
          if item.index is newIndex
            item.index = i
            #update this object in firebase
        
        list.forEach (item)->
          if item.id is id
            item.index = newIndex
            #update this object in firebase
      return  
    $s.save = ->
      # $s.list do firebase save for this specific project or create it
      # $mdToast.show $mdToast.simple().content('Saving')
      toast = $mdToast.simple().content("Saved").position("bottom")
      $mdToast.show toast
      return
    $s.commit = (item)->
      if $rp.listId isnt "create"
        path = "/project/"+$rp.id+"/"+$rp.listId+"/"+item.id+"/commit"
        $l.path path
      return
    $s.goToItem = (itemId)->
      if $rp.listId isnt "create"
        path = "/project/"+$rp.id+"/"+$rp.listId+"/"+itemId
        $l.path path
      return  
    $s.cancel = ->
      $l.path "/project/"+$rp.id
      return
    return
]