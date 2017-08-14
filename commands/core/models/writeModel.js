const fs = require('fs')
const nunjucks = require('nunjucks')
const toCamelCase = require('../../../utils/toCamelCase')

module.exports = (resource, fields) => {
  const modelTpl = fs.readFileSync(__dirname + '/tpls/modelName.js.tpl').toString()
  const initialModel = toCamelCase(resource)
  const keys = Object.keys(fields)
  const options = {resource: initialModel, fields, keys}
  const model = nunjucks.renderString(modelTpl, options)
  fs.writeFileSync(`${process.cwd()}/src/models/${initialModel}.js`, model)
}
