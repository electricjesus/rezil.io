app = angular.module "MaterialApp",["ngResource","ngRoute","ngAnimate","ngMaterial","firebase"]

app.config [
  "$routeProvider"
  "$locationProvider"
  ( $routeProvider, $locationProvider )->
    $locationProvider.html5Mode true
      
    $routeProvider
    .when "/", 
      template: JST["public/main.html"]()
      controller:"MainCtrl"
    .otherwise redirectTo:"/"
]

app.controller "MainCtrl",[
  "$scope"
  "$firebase"
  ($s, $fb)->
    messagesRef = new Firebase "https://intense-inferno-653.firebaseio.com/messages"
    $s.messages = $fb(messagesRef).$asArray()

    $s.m = ""
    $s.addMessage = ->
      $s.messages.$add message:$s.m
      $s.m = ""

    $s.updateMessage = (key,message)->
      $s.messages[key] = message
      $s.messages.$save(key)
    return
]

app.controller "AnotherCtrl",[
  "$scope"
  "$firebase"
  ($s, $fb)->
    messageRef = new Firebase "https://intense-inferno-653.firebaseio.com/messages/1"
    $s.message = $fb(messageRef).$asObject()

    return
]