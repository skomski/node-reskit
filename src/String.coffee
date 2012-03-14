Key = require './Key'

class String extends Key
  module.exports = String

  set: (value, cb) ->
    @pool.client().set @name, value, cb

  get: (cb) ->
    @pool.client().get @name, cb

  getset: (value, cb) ->
    @pool.client().getset @name, value, cb

  setnx: (value, cb) ->
    @pool.client().setnx @name, value, cb

  incr: (cb) ->
    @pool.client().incr @name, cb

  decr: (cb) ->
    @pool.client().decr @name, cb

  incrby: (n, cb) ->
    @pool.client().incrby @name, n, cb

  decrby: (n, cb) ->
    @pool.client().decrby @name, n, cb

  length: (cb) ->
    @pool.client().strlen @name, cb

  append: (value, cb) ->
    @pool.client().append @name, value, cb

  range: (start, end, cb) ->
    @pool.client().getrange @name, start, end, cb

  first: (n, cb) ->
    @range 0, --n, cb

  last: (n, cb) ->
    @range -n, -1, cb
