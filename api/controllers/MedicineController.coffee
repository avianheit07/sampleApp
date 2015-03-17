module.exports =
  list: (req, res) ->
    Medicine.find().paginate({page: 0, limit: 10}).exec (err, result) ->
      if err
        res.serverErr err

      res.json result

  create: (req, res) ->
    data = req.body

    Medicine.create data
    .exec (err, result) ->
      if err
        res.serverErr err
        return

      if result
        res.json result

  logs: (req, res) ->
    Logs.find().exec (err, result) ->
      if err
        res.serverErr err

      res.json result
  logsPost: (req, res) ->
    data     = req.body
    data.inAttendance =
      email: data.inAttendance
    medicine = data.medicine
    delete data.medicine

    if medicine.count > 0 # greater than zero
      data.medicine =
        id: medicine.id
        count: data.count
        remainingAtTime: 0
        data: new Date()

      if medicine.count > data.count # can still be subtracted
        data.medicine.remainingAtTime = medicine.count - data.count
      else
        remaining = 0
        data.medicine.count = medicine.count
        data.medicine.remainingAtTime = 0

      Logs.create data
      .exec (err, result) ->
        console.log err, result
        if err
          res.serverErr err

        if result
          medicine.count = data.medicine.remainingAtTime
          Medicine.update id: medicine.id
          , medicine, (err, result) ->
            res.json result
    else
      res.json null
  symptoms: (req, res) ->
    Symptoms.find().exec (err, result) ->
      if err
        res.serverErr err

      res.json result

  symptomsPost: (req, res) ->
    data = req.body
    console.log data, 'post'
    Symptoms.create data
    .exec (err, result) ->
      if err
        res.serverErr err

      if result
        res.json result