const fs = require('fs')
const nunjucks = require('nunjucks')
const toCamelCase = require('../../../utils/toCamelCase')

module.exports = (projectName, resource) => {
  const putTpl = fs.readFileSync(__dirname + '/tpls/routes/put.js.tpl').toString()
  const options = { resource, model: toCamelCase(resource) }
  const put = nunjucks.renderString(putTpl, options)
  fs.writeFileSync(`${process.cwd()}/src/routes/${resource}s/put.js`, put)
}
