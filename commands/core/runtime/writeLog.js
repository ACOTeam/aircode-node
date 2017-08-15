const fs = require('fs')
const nunjucks = require('nunjucks')

module.exports = (projectName) => {
  const logTpl = fs.readFileSync(__dirname + '/tpls/log.js.tpl').toString()
  const options = {}
  const log = nunjucks.renderString(logTpl, options)
  fs.writeFileSync(`./${projectName}/src/runtime/log.js`, log)
}
