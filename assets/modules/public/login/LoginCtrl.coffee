# Create a factory the will return the firebase auth object
app.factory "Auth", [
  "$firebaseAuth"
  ($firebaseAuth) ->
    #connect to firebase
    ref = new Firebase("https://rezilio.firebaseio.com/");
  
    #return the firebase Authorize Object
    return $firebaseAuth(ref)
]

# and use it in our login controller
app.controller "LoginCtrl",[
  "$scope"
  "$firebase"
  "Auth"
  ($s,$fb,Auth)->
    # Now to use the return firebase Authorize object, assigned it to $s.auth 
    $s.auth = Auth
    # Then get the authorized user details (like fb or twitter handle and etc.) by calling $s.auth.$getAuth() an store it to $s.user 
    $s.user = $s.auth.$getAuth()
    return
]