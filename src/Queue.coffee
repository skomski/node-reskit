List = require './List'

class Queue extends List
  module.exports = Queue

  pop: (cb) ->
    @brpop 0, (err, result) ->
      return cb err if err?
      cb null, result[1]

  popPush: (dest, cb) ->
    @brpoplpush dest.name || dest, 0, (err, result) ->
      return cb err if err?
      cb null, result

  push: (str, cb) ->
    @lpush str, cb

