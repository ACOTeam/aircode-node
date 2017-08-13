const fs = require('fs')
const nunjucks = require('nunjucks')

module.exports = (projectName) => {
  const schemaTpl = fs.readFileSync(__dirname + '/tpls/schema.js.tpl').toString()
  const options = {}
  const schema = nunjucks.renderString(schemaTpl, options)
  fs.writeFileSync(`./${projectName}/src/graphql/schema.js`, schema)
}
