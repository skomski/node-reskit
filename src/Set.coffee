Key = require './Key'

class Set
  module.exports = Set

  add: (value, cb) ->
    @pool.client().sadd @name, value, cb

  pop: (cb) ->
    @pool.client().spop @name, cb

  random: (cb) ->
    @pool.client().srandmember @name, cb

  has: (value, cb) ->
    @pool.client().sismember @name, value, cb

  members: (cb) ->
    @pool.client().smembers @name, cb

  remove: (value, cb) ->
    @pool.client().srem @name, value, cb

  length: (cb) ->
    @pool.client().scard @name, cb

  union: (key, cb) ->
    @pool.client().sunion @name, key.name || key, cb

  diff: (key, cb) ->
    @pool.client().sdiff @name, key.name || key, cb

  inter: (key, cb) ->
   @pool.client.sinter @name, key.name || key, cb
