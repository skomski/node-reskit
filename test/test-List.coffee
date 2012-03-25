Assert = require 'assert'
{ List: RedisList, Pool: RedisPool } = require '..'

testFinished = false

pool = new RedisPool
  host : '127.0.0.1'
  port : 6379

list = new RedisList
  name : 'testlist'
  pool : pool

list.delete (err) ->
  Assert.ifError err

  list.lpush ['12', '13'], (err) ->
    Assert.ifError err

    list.all (err, items) ->
      Assert.ifError err
      Assert.deepEqual items, ['13', '12']

      list.length (err, length) ->
        Assert.ifError err
        Assert.equal length, 2

        testFinished = true
        pool.quit()

process.on 'exit', () ->
  Assert.ok testFinished
