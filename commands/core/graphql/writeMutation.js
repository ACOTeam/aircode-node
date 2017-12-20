const fs = require('fs')
const nunjucks = require('nunjucks')

module.exports = (projectName) => {
  const mutationTpl = fs.readFileSync(__dirname + '/tpls/mutation.js.tpl').toString()
  const options = {}
  const mutation = nunjucks.renderString(mutationTpl, options)
  fs.writeFileSync(`./${projectName}/src/graphql/mutation.js`, mutation)
}
