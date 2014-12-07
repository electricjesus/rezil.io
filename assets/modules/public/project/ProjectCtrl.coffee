app.controller "ProjectCtrl",[
  "$scope"
  "$firebase"
  "$routeParams"
  "$location"
  "$mdToast"
  ($s, $fb, $rp, $l, $mdToast)->
    $s.PROJECT_ID = $rp.id
    create = $rp.id is "create"
    
    $s.project = {}
    #get Firebase object using $rp.id if create is false
    # $s.project = $fb(REF).$asObject()
    
    #get Firebase object
    $s.lists = [
      {
        id: 1
        name: "Food"
        progress: 80
        index: 1
      }
      {
        id: 2
        name: "Cash"
        progress: 80
        index: 0
      }
      {
        id: 3
        name: "Volunteers"
        progress: 80
        index: 2
      }
    ]
    
    # get array of objects from $firebase of all items related to this Project
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
      {
        id:3
        projectId:1
        listId: 2
        name: "1st Month Preparation Budget"
        index: 0
        goal: [
          {
            "unit":"$"
            "value":10000
          }
        ],
        progress: 90
      }
      {
        id:4
        projectId:1
        listId: 2
        name: "2nd Month Mobilization Budget"
        index: 1
        goal: [
          {
            "unit":"$"
            "value":2500
          }
        ],
        progress: 64
      }
      {
        id:5
        projectId:1
        listId: 3
        name: "Drivers"
        index: 0
        goal: [
          {
            "unit":"Drivers"
            "value":3
          }
        ],
        progress: 66
      }
      {
        id:6
        projectId:1
        listId: 3
        name: "Relief Goods Repacker MORNING"
        index: 1
        goal: [
          {
            "unit":"Volunteers"
            "value":50
          }
        ]
        progress: 20
      }
      {
        id:7
        projectId:1
        listId: 3
        name: "Relief Goods Repacker AFTERNOON"
        index: 2
        goal: [
          {
            "unit":"Volunteers"
            "value":50
          }
        ],
        progress: 30
      }
    ]
    
    # sorting lists
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
    $s.commit = (item)->
      if $rp.id isnt "create"
        path = "/project/"+item.projectId+"/"+item.listId+"/"+item.id+"/commit"
        $l.path path
      return
    $s.goToItem = (itemId,listId)->
      if $rp.id isnt "create"
        path = "/project/"+$rp.id+"/"+listId+"/"+itemId
        $l.path path
      return
    $s.goToList = (listId)->
      if $rp.id isnt "create"
        path = "/project/"+$rp.id+"/"+listId 
        $l.path path
        
    $s.save = ->
      # $s.project do firebase save for this specific project or create it
      # $mdToast.show $mdToast.simple().content('Saving')
      toast = $mdToast.simple().content("Saved").position("bottom")
      $mdToast.show toast
    $s.cancel = ->
      $l.path "/"
    return
]