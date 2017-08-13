const fs = require('fs')
const nunjucks = require('nunjucks')

module.exports = (projectName) => {
  const outputFormatTpl = fs.readFileSync(__dirname + '/tpls/outputFormat.js.tpl').toString()
  const options = {}
  const outputFormat = nunjucks.renderString(outputFormatTpl, options)
  fs.writeFileSync(`./${projectName}/src/middlewares/outputFormat.js`, outputFormat)
}
