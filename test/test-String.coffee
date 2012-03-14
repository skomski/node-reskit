Assert = require 'assert'
{ String: RedisString, Pool: RedisPool } = require '..'

testFinished = false

pool = new RedisPool
  host : '127.0.0.1'
  port : 6379

string = new RedisString
  name : 'teststring'
  pool : pool

string.set 'testvalue', (err) ->
  Assert.ifError err

  string.get (err, value) ->
    Assert.ifError err
    Assert.equal value, 'testvalue'

    string.getset 'testvalue2', (err, value) ->
      Assert.ifError err
      Assert.equal value, 'testvalue'

      string.setnx '222', (err) ->
        Assert.ifError err

        string.length (err, length) ->
          Assert.ifError err
          Assert.equal length, 10

          testFinished = true
          pool.quit()

process.on 'exit', () ->
  Assert.ok testFinished
