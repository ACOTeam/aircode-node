const fs = require('fs')
const nunjucks = require('nunjucks')

module.exports = (projectName) => {
  const queryTpl = fs.readFileSync(__dirname + '/tpls/query.js.tpl').toString()
  const options = {}
  const query = nunjucks.renderString(queryTpl, options)
  fs.writeFileSync(`./${projectName}/src/graphql/query.js`, query)
}
