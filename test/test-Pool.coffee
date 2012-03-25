Assert = require 'assert'
{ Channel: RedisChannel, Pool: RedisPool } = require '..'

testFinished = false

pool = new RedisPool
  host : '127.0.0.1'
  port : 6379
  maxClients: 6

# constructor

Assert.equal pool.port, 6379
Assert.equal pool.host, '127.0.0.1'
Assert.deepEqual pool.clients,  []
Assert.deepEqual pool.blockers, []
Assert.deepEqual pool.subscribers, []
Assert.equal pool.maxClients, 6

# client

client = pool.client()
Assert.equal pool.clients.length, 1
Assert.deepEqual pool.clients, [client]

pool.quit()
Assert.equal pool.clients.length, 0

# subscriber

Assert.equal pool.subscribers.length, 0

subscriber = pool.subscriber()
Assert.equal pool.subscribers.length, 1
Assert.deepEqual pool.subscribers, [subscriber]

pool.quit()
Assert.equal pool.clients.length, 0

# blocker

Assert.equal pool.blockers.length, 0

blocker = pool.blocker()
Assert.equal pool.blockers.length, 1
Assert.deepEqual pool.blockers, [blocker]

pool.end()
Assert.equal pool.blockers.length, 0

testFinished = true

process.on 'exit', () ->
  Assert.ok testFinished
