const fs = require('fs')
const nunjucks = require('nunjucks')
const toCamelCase = require('../../../utils/toCamelCase')

module.exports = (resource) => {
  const queryFile = `${process.cwd()}/src/graphql/query.js`
  if (fs.existsSync(queryFile)) {
    handlerExistFile(queryFile, resource)
  } else {
    handlerUnExistFile(`${__dirname}/tpls/query.js.tpl`, resource)
  }
}

function handlerExistFile (fileName, resource) {
  const initialModel = toCamelCase(resource)
  const options = { resource: initialModel }
  const queryFile = fs.readFileSync(fileName).toString()
  const queryFieldTpl = fs.readFileSync(`${__dirname}/tpls/queryField.tpl`).toString()
  const queryField = nunjucks.renderString(queryFieldTpl, options)

  const conbineQueryTpl = queryFile.replace(/\s{2}}\n}\)\n$/g, '') + queryField
  fs.writeFileSync(`${process.cwd()}/src/graphql/query.js`, conbineQueryTpl)
}

function handlerUnExistFile (tplName, resource) {
  const queryTpl = fs.readFileSync(tplName).toString()
  const initialModel = toCamelCase(resource)
  const options = { resource: initialModel }
  const query = nunjucks.renderString(queryTpl, options)
  fs.writeFileSync(`${process.cwd()}/src/graphql/query.js`, query)
}
