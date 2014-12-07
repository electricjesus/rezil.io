app = angular.module "Rezil.io",["ngResource","ngRoute","ngAnimate","ngMaterial","firebase"]

app.config [
  "$routeProvider"
  "$locationProvider"
  ( $routeProvider, $locationProvider )->
    $locationProvider.html5Mode true
      
    $routeProvider
    .when "/login",
      template: JST["public/login/login.html"]()
      controller: "LoginCtrl"
      
    .when "/", 
      template: JST["public/projects/projects.html"]()
      controller:"ProjectsCtrl"
    
    .when "/project/:id", 
      template: JST["public/project/project.html"]()
      controller:"ProjectCtrl"
    
    .when "/project/:id/:listId", 
      template: JST["public/list/list.html"]()
      controller:"ListCtrl"
    
    .when "/project/:id/:listId/:itemId", 
      template: JST["public/item/item.html"]()
      controller:"ItemCtrl"
    
    .when "/project/:id/:listId/:itemId/commit", 
      template: JST["public/commit/commit.html"]()
      controller:"CommitCtrl"
    
    .otherwise redirectTo:"/login"
    
    return
]

