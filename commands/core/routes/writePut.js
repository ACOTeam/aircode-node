const fs = require('fs')
const nunjucks = require('nunjucks')
const toCamelCase = require('../../../utils/toCamelCase')

module.exports = (projectName, resource) => {
  const putTpl = fs.readFileSync(__dirname + '/tpls/routes/put.js.tpl').toString()
  const fields = '{ title, price }'
  const options = { resource, model: toCamelCase(resource), fields }
  const put = nunjucks.renderString(putTpl, options)
  fs.writeFileSync(`./${projectName}/src/routes/${resource}s/put.js`, put)
}
