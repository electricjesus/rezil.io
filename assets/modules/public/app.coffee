app = angular.module "MaterialApp",["ngResource","ngRoute","ngAnimate","ngMaterial"]

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

    $s.title1 = 'Button'
    $s.title4 = 'Warn'
    $s.isDisabled = true
    $s.googleUrl = 'http://google.com'
    return
]