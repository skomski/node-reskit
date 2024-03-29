This is a fork of visionmedia's rediskit. Some additions and changes to fit into my projects. :)

# node-reskit [![Build Status](https://secure.travis-ci.org/Skomski/node-reskit.png?branch=master)](http://travis-ci.org/Skomski/node-reskit)

Redis backed data structures for Node.js

## Install

```
npm install reskit
```
## Example Usage

```javascript
var Reskit = require('reskit');

var pool = new Reskit.Pool({
  host: '127.0.0.1',
  port: 6379
});

var testString = new Reskit.String({
  name: 'testString',
  pool: pool
});

testString.set('testvalue', function(err) {
  if (err) throw err;

  testString.get(function(err, value) {
    if (err) throw err;

    console.log(value);
    pool.quit();
  });
});
```

## License

This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>
