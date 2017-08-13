const fs = require('fs')
const nunjucks = require('nunjucks')

module.exports = (projectName) => {
  const errorHandlerTpl = fs.readFileSync(__dirname + '/tpls/errorHandler.js.tpl').toString()
  const options = {}
  const errorHandler = nunjucks.renderString(errorHandlerTpl, options)
  fs.writeFileSync(`./${projectName}/src/middlewares/errorHandler.js`, errorHandler)
}
