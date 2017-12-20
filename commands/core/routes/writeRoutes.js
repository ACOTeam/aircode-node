const defaultMethods = ['GET', 'POST', 'LIST', 'PUT', 'DELETE']
const writeIndex = require('./writeIndex')
const writeGet = require('./writeGet')
const writePost = require('./writePost')
const writeList = require('./writeList')
const writePut = require('./writePut')
const writeDelete = require('./writeDel')

module.exports = (projectName, resource, schema, methods = defaultMethods) => {
  writeIndex(projectName, resource, schema, methods)
  methods.forEach((method) => {
    switch (method) {
      case 'GET':
        writeGet(projectName, resource)
        break
      case 'POST':
        writePost(projectName, resource)
        break
      case 'LIST':
        writeList(projectName, resource)
        break
      case 'PUT':
        writePut(projectName, resource)
        break
      case 'DELETE':
        writeDelete(projectName, resource)
        break
    }
  })
}
