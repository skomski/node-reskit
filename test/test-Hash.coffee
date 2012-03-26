Assert = require 'assert'
Redis = require '..'

testFinished = false

pool = new Redis.Pool
  host : '127.0.0.1'
  port : 6379

hash = new Redis.Hash
  name : 'testhash'
  pool : pool

hash.hmset { payload: '123', status: 200 }, (err) ->
  Assert.ifError err

  hash.all (err, values) ->
    Assert.ifError err

    console.error values
    Assert.deepEqual values, { "payload": "123", "status": "200" }

    testFinished = true
    pool.quit()

process.on 'exit', () ->
  Assert.ok testFinished
