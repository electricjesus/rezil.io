app.directive "commentBox",[
  "$firebase"
  ($fb)->
    restrict: "E"
    replace: true
    template: JST["public/comment-box/comment-box.html"]()
    scope:
      type: "@"
      id: "@"
      label: "@"
    link: (scope,element,attrs)->
      console.log scope.type,scope.id,scope.label
      return
]