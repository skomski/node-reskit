This is a fork of visionmedia's rediskit. Some additions and improvements :)

# node-reskit

[![Build Status](https://secure.travis-ci.org/Skomski/node-reskit.png?branch=master)](http://travis-ci.org/Skomski/node-reskit)

Redis backed data structures for Node.js

## Install

```
npm install reskit
```

```javascript
var Reskit = require('reskit');

var pool = new Reskit.Pool({
  host : '127.0.0.1'
  port : 6379
});

var string = new Reskit.String({
  name : 'teststring',
  pool : pool
});

string.set('testvalue', function(err) {
  if (err) throw err;
});
```

## License

Licensed under the MIT license.
