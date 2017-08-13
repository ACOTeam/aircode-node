const fs = require('fs')
const nunjucks = require('nunjucks')
const toCamelCase = require('../../../utils/toCamelCase')

module.exports = (projectName, resource) => {
  const postTpl = fs.readFileSync(__dirname + '/tpls/routes/post.js.tpl').toString()
  const fields = '{ title, price }'
  const options = { resource, model: toCamelCase(resource), fields }
  const post = nunjucks.renderString(postTpl, options)
  fs.writeFileSync(`./${projectName}/src/routes/${resource}s/post.js`, post)
}
