Key = require './Key'

class Hash extends Key
  module.exports = Hash

  set: (key, value, cb) ->
    @pool.client().hset @name, key, value, cb

  get: (key, cb) ->
    @pool.client().hget @name, field, cb

  hmset: (object, cb) ->
    @pool.client().hmset @name, object, cb

  length: (cb) ->
    @pool.client().hlen @name, cb

  keys: (cb) ->
    @pool.client().hkeys @name, cb

  has: (key, cb) ->
    @pool.client().hexists @name, key, cb

  values: (cb) ->
    @pool.client().hvals @name, cb

  all: (cb) ->
    @pool.client().hgetall @name, cb

  delete: (key, cb) ->
    @pool.client().delete @name, key, cb
