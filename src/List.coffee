Key = require './Key'

class List extends Key
  module.exports = List

  lpush: (item, cb) ->
    @pool.client().lpush @name, item, cb

  rpush: (item, cb) ->
    @pool.client().rpush @name, item, cb

  lpop: (cb) ->
    @pool.client().lpop @name, cb

  rpop: (cb) ->
    @pool.client().rpop @name, cb

  brpop: (timeout, cb) ->
    @pool.blocker().brpop @name, timeout, cb

  brpoplpush: (dest, timeout, cb) ->
    @pool.blocker().brpoplpush @name, dest, timeout, cb

  blpop: (timeout, cb) ->
    @pool.blocker().blpop @name, timeout, cb

  range: (start, stop, cb) ->
    @pool.client().lrange @name, start, stop, cb

  trim: (start, stop, cb) ->
    @pool.client().ltrim @name, start, stop, cb

  index: (index, cb) ->
    @pool.client().lindex @name, index, cb

  remove: (count, val, cb) ->
    @pool.client().lrem @name, count, val, cb

  all: (cb) ->
    @range 0, -1, cb

  length: (cb) ->
    @pool.client().llen @name, cb
