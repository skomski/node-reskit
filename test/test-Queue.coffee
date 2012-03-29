Assert = require 'assert'
{ Queue: RedisQueue, Pool: RedisPool } = require '..'

redis = require('redis').createClient()

testFinished = false

pool = new RedisPool
  host: '127.0.0.1'
  port: 6379

newJobs = new RedisQueue
  name: 'newJobs'
  pool: pool

readyJobs = new RedisQueue
  name: 'readyJobs'
  pool: pool

redis.del ['newJobs', 'readyJobs'], (err) ->
  Assert.ifError err

  newJobs.push ['testvalue', 'testvalue2'], (err) ->
    Assert.ifError err

    newJobs.pop (err, item) ->
      Assert.ifError err
      Assert.equal item, 'testvalue'

      newJobs.popPush readyJobs, (err, item) ->
        Assert.ifError err
        Assert.equal item, 'testvalue2'

        readyJobs.pop (err, item) ->
          Assert.ifError err

          Assert.equal item, 'testvalue2'

          testFinished = true
          redis.quit()
          pool.quit()

process.on 'exit', () ->
  Assert.ok testFinished
