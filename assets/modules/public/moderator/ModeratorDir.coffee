app.directive "moderatorSelector",[
  "$firebase"
  ($fb)->
    restrict: "E"
    replace: true
    template: JST["public/moderator/moderator.html"]()
    require:"ngModel"
    scope:
      moderatorIds:"=ngModel"
    link: (scope,element,attrs)->
      #this directive also fetch from firebase the users in the moderatorIds array
      #get Firebase object
      scope.moderators = [
        {
          name: "Neil Paul Molina"
          email: "get.neilmolina@gmail.com"
          id: 1
        }
        {
          name: "Neil Paul Molina 2"
          email: "get.neilmolina@gmail.com 2"
          id: 2
        }  
      ]
      scope.removeModerator = (user)->
        console.log "do something to remove user as moderator"
      
      scope.search = ""
      # user searches for other users by string matching, its applied to $s.usersFound array
      scope.searchForUser = ->
        console.log "search something then apply to $s.usersFound"
        return
      scope.usersFound = [
        {
          name: "Neil Paul Molina"
          email: "get.neilmolina@gmail.com"
          id: 1
        }  
        {
          name: "Neil Paul Molina 2"
          email: "get.neilmolina@gmail.com 2"
          id: 2
        }  
      ]
      
      scope.makeModerator = (user)->
        # do something to user to make moderators
        console.log user
        return
      return
]