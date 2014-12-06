var toUnk = [
  "/:unk",
  "/project/:id",
  "/project/:id/:listId",
  "/project/:id/:listId/:itemId",
  "/project/:id/:listId/:itemId/commit"
]
// /project/:id/:listId/:itemId/commit
routes = {
  '/': {
    controller: 'SiteController',
    action:'index'
  },
  '/:unk':{
    controller: 'SiteController',
    action: 'index'
  }
};

toUnk.forEach(function(url){
  routes[url] = {
    controller: 'SiteController',
    action: 'index',
    skipAssets: true
  }
})
module.exports.routes = routes;