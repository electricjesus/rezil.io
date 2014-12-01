app = angular.module "MaterialApp",["ngResource","ngRoute","ngAnimate"]

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
  ($s)->

    return
]