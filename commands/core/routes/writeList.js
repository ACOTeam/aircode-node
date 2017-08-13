const fs = require('fs')
const nunjucks = require('nunjucks')
const toCamelCase = require('../../../utils/toCamelCase')

module.exports = (projectName, resource) => {
  const listTpl = fs.readFileSync(__dirname + '/tpls/routes/list.js.tpl').toString()
  const options = { resource, model: toCamelCase(resource) }
  const get = nunjucks.renderString(listTpl, options)
  fs.writeFileSync(`./${projectName}/src/routes/${resource}s/list.js`, get)
}
