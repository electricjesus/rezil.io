app.controller "ItemCtrl",[
  "$scope"
  "$firebase"
  "$routeParams"
  "$location"
  "$mdToast"
  ($s, $fb, $rp, $l, $mdToast)->
    $s.ITEM_ID = $rp.itemId
    create = $rp.itemId is "create"
    
    $s.item =
      moderators:[]
      goal:[
        {
          unit:"Baboy"
          value: 200
        }  
      ]
    #get Firebase object using $rp.itemId if create is false
    # $s.item = $fb(REF).$asObject()
    
    #get all commits for this item
    $s.commits = [
      {
        id: 1
        itemId: 1
        listId: 1
        projectId: 1
        user:{
          name: "John Smith"
          email: "john.smith@gmail.com"
        }
        unit: 0
        value: 100
        date: "Dec 7, 2014 8:59 am"
      }
      {
        id: 2
        itemId: 1
        listId: 1
        projectId: 1
        user:{
          name: "Dam Van"
          email: "damn.van@gmail.com"
        }
        unit: 0
        value: 80
        date: "Dec 10, 2014 8:59 am"
      }
    ]
    $s.impact = (commit)->
      impact = 0
      impact = (commit.value / $s.item.goal[commit.unit].value) * 100 if commit
      
      return impact
      
    $s.commit = (item)->
      if $rp.id isnt "create"
        path = "/project/"+item.projectId+"/"+item.listId+"/"+item.id+"/commit"
        $l.path path
      return    
    $s.save = ->
      # $s.project do firebase save for this specific project or create it
      # $mdToast.show $mdToast.simple().content('Saving')
      toast = $mdToast.simple().content("Saved").position("bottom")
      $mdToast.show toast
    $s.cancel = ->
      $l.path "/project/"+$rp.id+"/"+$rp.listId  
    return
]