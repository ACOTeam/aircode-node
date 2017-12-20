const fs = require('fs')
const nunjucks = require('nunjucks')

module.exports = (projectName) => {
  const validatorTpl = fs.readFileSync(__dirname + '/tpls/validator.js.tpl').toString()
  const options = {}
  const validator = nunjucks.renderString(validatorTpl, options)
  fs.writeFileSync(`./${projectName}/src/lib/validator.js`, validator)
}
