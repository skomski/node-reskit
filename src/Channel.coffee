{ EventEmitter } = require 'events'

class Channel extends EventEmitter
  module.exports = Channel

  constructor: ({ @name, @pool }) ->
    @subscriber = undefined

  publish: (message, cb) ->
    @pool.client().publish @name, message, cb

  unsubscribe: (cb) ->
    return cb new Error('Channel is not subscribed') unless @subscriber

    @subscriber.unsubscribe @name, (err) =>
      return cb err if err
      @subscriber = undefined
      return cb null

  subscribe: (cb) ->
    return cb null if @subscriber

    subscriber = @pool.subscriber()
    subscriber.on 'message', (channel, message) =>
      @emit 'message', message if channel == @name

    subscriber.subscribe @name, (err) =>
      return cb err if err
      @subscriber = subscriber
      return cb null
