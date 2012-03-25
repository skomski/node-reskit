Assert = require 'assert'
{ Channel: RedisChannel, Pool: RedisPool } = require '..'

testFinished = false

pool = new RedisPool
  host : '127.0.0.1'
  port : 6379

channel = new RedisChannel
  name : 'testchannel'
  pool : pool

channel.on 'message', (message) ->
  Assert.equal message, 'testmessage'

  channel.unsubscribe (err) ->
    Assert.ifError err

    testFinished = true
    pool.quit()

channel.subscribe (err) ->
  Assert.ifError err

  channel.publish 'testmessage', (err) ->
    Assert.ifError

process.on 'exit', () ->
  Assert.ok testFinished
