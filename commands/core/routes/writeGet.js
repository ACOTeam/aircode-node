const fs = require('fs')
const nunjucks = require('nunjucks')
const toCamelCase = require('../../../utils/toCamelCase')

module.exports = (projectName, resource) => {
  const getTpl = fs.readFileSync(__dirname + '/tpls/routes/get.js.tpl').toString()
  const options = { resource, model: toCamelCase(resource) }
  const get = nunjucks.renderString(getTpl, options)
  fs.writeFileSync(`./${projectName}/src/routes/${resource}s/get.js`, get)
}
