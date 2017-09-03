const fs = require('fs')
const nunjucks = require('nunjucks')
const toCamelCase = require('../../../utils/toCamelCase')

module.exports = (resource) => {
  const queryTpl = fs.readFileSync(__dirname + '/tpls/query.js.tpl').toString()
  const initialModel = toCamelCase(resource)
  const options = { resource: initialModel }
  const query = nunjucks.renderString(queryTpl, options)
  fs.writeFileSync(`${process.cwd()}/src/graphql/query.js`, query)
}
