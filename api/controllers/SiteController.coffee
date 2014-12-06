FirebaseTokenGenerator = require("firebase-token-generator")

tokenGenerator = new FirebaseTokenGenerator("i8KdNa6WcwHuUG64muwNbXV434HEoDuo5AA2Kz98")

module.exports =
  index: (req,res)->
    base = req.headers.host
    res.view "public",
      base:base
  authenticate: (req,res)->
    token = tokenGenerator.createToken({uid: "1", some: "arbitrary", data: "here"})
    res.json token