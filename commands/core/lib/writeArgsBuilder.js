const fs = require('fs')
const nunjucks = require('nunjucks')

module.exports = (projectName) => {
  const argsBuilderTpl = fs.readFileSync(__dirname + '/tpls/argsBuilder.js.tpl').toString()
  const options = {}
  const argsBuilder = nunjucks.renderString(argsBuilderTpl, options)
  fs.writeFileSync(`./${projectName}/src/lib/argsBuilder.js`, argsBuilder)
}
