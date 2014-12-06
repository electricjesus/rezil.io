app.controller "ProjectsCtrl",[
  "$scope"
  "$firebase"
  "$location"
  ($s,$fb,$l)->
    
    #replace with $firebase promise for objects
    $s.projects = [
      {
        id: 999
        name: "Project Pagsulog Abuso Ruby 22"
        description: "Lorem ipsum dolor ssad dasfdsa dasf da asfdasfs fdasf da fdsafdsa sa fit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        location: "Barangay Bigaa safdasfasfsf ds afdasfdsafsa"
        complete: 75
      }
      {
        id: 999
        name: "Project Pagsulog Ahh Ruby 28"
        description: "Lorem ipsum  ssfdsa fsa fsaf dsa fdasf saf  asdfdsa fdasf dasdolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        location: "Barangay Sorsogon afdsa fdasfdsaf sda sdafdsaf dasf"
        complete: 78
      }   
    ]
    $s.view =
      selectedIndex: 0
      next: ->
        i = parseInt $s.view.selectedIndex
        $s.view.selectedIndex = Math.min( i + 1, 2)

        return
      prev: ->
        i = parseInt $s.view.selectedIndex
        $s.view.selectedIndex = Math.max( i - 1, 0)
        return
    
    #determine whehter a project is new/followed or active
    $s.projectFilter = (project)->
      return projectStatus[$s.view.selectedIndex].test project
    
    
    projectStatus = [
      {
        test: (project)->
          test = true
          # test if New
          return test
      }
      {
        test: (project)->
          test = true
          # test if Followed
          return test
      }
      {
        test: (project)->
          test = true
          # test if Active
          return test
      }
    ]
    
    $s.goTo = (id)->
      $l.path "/project/"+id if id
    $s.create = ->
      $s.goTo "create"
    return
]