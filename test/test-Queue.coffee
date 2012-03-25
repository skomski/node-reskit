Assert = require 'assert'
{ Queue: RedisQueue, Pool: RedisPool } = require '..'

testFinished = false

pool = new RedisPool
  host : '127.0.0.1'
  port : 6379

queue = new RedisQueue
  name : 'testqueue'
  pool : pool

queue.push 'testvalue', (err) ->
  Assert.ifError err

  queue.pop (err, item) ->
    Assert.ifError err
    Assert.equal item, 'testvalue'

    testFinished = true
    pool.quit()

process.on 'exit', () ->
  Assert.ok testFinished
