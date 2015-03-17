module.exports =
  index: (req, res) ->
    res.view "public"

  # login: (req, res) ->
  #   filter =
  #     email: req.body.email
  #     password: req.body.password

  #   Employer.findOne(filter).exec (err, user) ->
  #     res.json err  if err
  #     if user
  #       req.session.user = user
  #     else
  #       Employer.create(filter).exec (err, data) ->
  #         console.log err  if err

  #     res.redirect "/"


  # logout: (req, res) ->
  #   req.session.destroy()
  #   res.redirect "/"