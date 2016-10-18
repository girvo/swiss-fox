/**
 * Top-level server
 */

const app = require('koa')()
const path = require('path')
const fs = require('fs')
const mount = require('koa-mount')
const serve = require('koa-static')

// Serve static files
app.use(serve(path.resolve(__dirname, 'web')))
app.use(mount('/assets', serve(path.resolve(__dirname, 'build'))))

// Route to index.html always
app.use(mount('*', function * (next) {
  const file = yield fs.readFile(path.resolve(__dirname, 'web', 'index.html'))
  this.body = file.toString()
}))

app.listen(3000)
