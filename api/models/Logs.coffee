Logs = 
  adapter: "mongo"
  schema: true
  attributes:
    fullName: "string"
    email: "string"
    meditabId: "string"
    medicine: "object"
    inAttendance: "object"

module.exports = Logs

###
medicine : [
  {
    medicine: id
    count: count
    remainingAtTime: count
    date: date
  }
]

inAttendance: {
  email: st
}
###