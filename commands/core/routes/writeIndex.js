const fs = require('fs')
const nunjucks = require('nunjucks')

const filePath = __dirname

module.exports = (projectName, resource) => {
  const fileName = `./${projectName}/src/routes/index.js`
  const resourceDir = `./${projectName}/src/routes/${resource}s`
  const isExistInde = fs.existsSync(fileName)
  const isExistResource = fs.existsSync(resourceDir)
  if (isExistResource) throw new Error(`resource: ${resource} is exist.`)
  fs.mkdirSync(resourceDir)
  const readFile = isExistInde ? fileName : `${filePath}/tpls/base/index.js.tpl`
  const indexTpl = fs.readFileSync(readFile).toString()

  const getTpl = fs.readFileSync(filePath + '/tpls/base/get.tpl').toString()
  const listTpl = fs.readFileSync(filePath + '/tpls/base/list.tpl').toString()
  const postTpl = fs.readFileSync(filePath + '/tpls/base/post.tpl').toString()
  const putTpl = fs.readFileSync(filePath + '/tpls/base/put.tpl').toString()
  const deleteTpl = fs.readFileSync(filePath + '/tpls/base/delete.tpl').toString()
  const graphqlTpl = fs.readFileSync(filePath + '/tpls/base/graphql.tpl').toString()

  const options = { resource }

  const index = nunjucks.renderString(indexTpl, options)
  const graphql = nunjucks.renderString(graphqlTpl, options)
  const get = nunjucks.renderString(getTpl, options)
  const list = nunjucks.renderString(listTpl, options)
  const post = nunjucks.renderString(postTpl, options)
  const put = nunjucks.renderString(putTpl, options)
  const del = nunjucks.renderString(deleteTpl, options)

  const combineTpl = index + graphql + get + list + post + put + del
  fs.writeFileSync(`./${projectName}/src/routes/index.js`, combineTpl)
}
