const fs = require('fs')
const nunjucks = require('nunjucks')
const toCamelCase = require('../../../utils/toCamelCase')

const filePath = __dirname

module.exports = (projectName, resource, schema, methods) => {
  const fileName = `${process.cwd()}/src/routes/index.js`
  const resourceDir = `${process.cwd()}/src/routes/${resource}s`
  const isExistIndex = fs.existsSync(fileName)
  const isExistResource = fs.existsSync(resourceDir)
  if (isExistResource) {
    throw new Error(`resource: ${resource} is exist.`)
  } else {
    fs.mkdirSync(resourceDir)
  }
  const readFile = isExistIndex ? fileName : `${filePath}/tpls/base/index.js.tpl`
  const indexTpl = fs.readFileSync(readFile).toString()

  let get, post, put, list, del, graphql
  const options = { resource: toCamelCase(resource) }

  const index = nunjucks.renderString(indexTpl, { resource })

  methods.forEach((method) => {
    switch (method) {
      case 'GET':
        const getTpl = fs.readFileSync(filePath + '/tpls/base/get.tpl').toString()
        get = nunjucks.renderString(getTpl, options)
        break
      case 'LIST':
        const listTpl = fs.readFileSync(filePath + '/tpls/base/list.tpl').toString()
        list = nunjucks.renderString(listTpl, options)
        break
      case 'POST':
        const postOptions = Object.assign({}, options, { fields: schema, keys: Object.keys(schema) })
        const postTpl = fs.readFileSync(filePath + '/tpls/base/post.tpl').toString()
        post = nunjucks.renderString(postTpl, postOptions)
        break
      case 'PUT':
        const putOptions = Object.assign({}, options, { fields: schema, keys: Object.keys(schema) })
        const putTpl = fs.readFileSync(filePath + '/tpls/base/put.tpl').toString()
        put = nunjucks.renderString(putTpl, putOptions)
        break
      case 'DELETE':
        const deleteTpl = fs.readFileSync(filePath + '/tpls/base/delete.tpl').toString()
        del = nunjucks.renderString(deleteTpl, options)
        break
      // case 'GRAPHQL':
      //   const graphqlTpl = fs.readFileSync(filePath + '/tpls/base/graphql.tpl').toString()
      //   graphql = nunjucks.renderString(graphqlTpl, options)
      //   break
    }
  })

  const combineTpl = index + graphql + get + list + post + put + del
  fs.writeFileSync(`${process.cwd()}/src/routes/index.js`, combineTpl)
}
