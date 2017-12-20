const fs = require('fs')
const nunjucks = require('nunjucks')
const toCamelCase = require('../../../utils/toCamelCase')

module.exports = (projectName, resource) => {
  const deleteTpl = fs.readFileSync(__dirname + '/tpls/routes/delete.js.tpl').toString()
  const options = { resource, model: toCamelCase(resource) }
  const del = nunjucks.renderString(deleteTpl, options)
  fs.writeFileSync(`${process.cwd()}/src/routes/${resource}s/delete.js`, del)
}
