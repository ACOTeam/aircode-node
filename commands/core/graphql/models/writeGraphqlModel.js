const fs = require('fs')
const nunjucks = require('nunjucks')
const toCamelCase = require('../../../../utils/toCamelCase')
const mongoToGraphqlMaps = {
  String: 'String',
  Number: 'Int',
  Array: 'List',
  Boolean: 'Boolean',
  ObjectId: 'String',
  Data: 'Date',
  Buffer: 'Buffer',
  Mixed: 'Mixed'
}

module.exports = (resource, fields) => {
  const grapqlModelTpl = fs.readFileSync(__dirname + '/tpls/grapqlModel.js.tpl').toString()
  const initialModel = toCamelCase(resource)
  const keys = Object.keys(fields)
  const options = { resource: initialModel, keys, fields, mongoToGraphqlMaps }
  const grapqlModel = nunjucks.renderString(grapqlModelTpl, options)
  fs.writeFileSync(`${process.cwd()}/src/graphql/models/${initialModel}.js`, grapqlModel)
}
