module.exports =
  index: (req,res)->
    base = req.headers.host
    res.view "public",
      base:base