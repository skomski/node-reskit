Redis = require 'redis'

class RedisPool
  module.exports = RedisPool

  constructor:  ({ @port, @host, @maxClients }) ->
    @clients = []
    @blockers = []
    @subscribers = []
    @maxClients ?= 10

  end: () ->
    allClients = @clients.concat(@blockers, @subscribers)
    for index, client of allClients
      client.end()

    @clients     = []
    @blockers    = []
    @subscribers = []

  quit: () ->
    allClients = @clients.concat(@blockers, @subscribers)
    for index, client of allClients
      client.quit()

    @clients     = []
    @blockers    = []
    @subscribers = []

  client: () ->
    if @clients.length == @maxClients
      return @clients[Math.random() * @maxClients | 0]
    else
      client = Redis.createClient @port, @host
      @clients.push client
      return client

  subscriber: () ->
    if @subscribers.length == @maxClients
      return @subscribers[Math.random() * @maxClients | 0]
    else
      client = Redis.createClient @port, @host
      @subscribers.push client
      return client

  blocker: () ->
    client = Redis.createClient @port, @host
    @blockers.push client
    return client
