const fs = require('fs')
const nunjucks = require('nunjucks')

module.exports = (projectName) => {
  const queryBuilderTpl = fs.readFileSync(__dirname + '/tpls/queryBuilder.js.tpl').toString()
  const options = {}
  const queryBuilder = nunjucks.renderString(queryBuilderTpl, options)
  fs.writeFileSync(`./${projectName}/src/lib/queryBuilder.js`, queryBuilder)
}
