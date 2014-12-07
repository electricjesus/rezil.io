app.controller "CommitCtrl",[
  "$scope"
  "$firebase"
  "$routeParams"
  "$location"
  "$mdToast"
  "$timeout"
  ($s, $fb, $rp, $l, $mdToast, $t)->
    
    # get item data via $fb
    $s.item =
      name: "Pork / Lechon"
      moderators:[]
      goal:[
        {
          id: 1
          unit:"Lechon"
          value: 200
        }
        {
          id: 2
          unit: "kilo"
          value: 2000
        }
      ]
      progress: 80
    $s.commit = {}
    $s.getProgress = ->
      add = 0
      if $s.commit.value and $s.commit.unit
        goalIdx = $s.item.goal.map (e)->
          return e.id
        .indexOf +$s.commit.unit
        add = ($s.commit.value / $s.item.goal[goalIdx].value)*100
      result = $s.item.progress + add
      console.log result
      return result
    $s.submit = ->
      #submit the commit then go back to previous $location
      toast = $mdToast.simple().content("Commitment submitted, thank you very much").position("bottom")
      $mdToast.show toast
      $t ->
        $l.path "/project/"+$rp.id+"/"+$rp.listId+"/"+$rp.itemId
      ,2000
    return
]