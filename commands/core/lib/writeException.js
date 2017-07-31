const fs = require('fs')
const nunjucks = require('nunjucks')

module.exports = (projectName) => {
	const exceptionTpl = fs.readFileSync(__dirname + '/tpls/exception.js.tpl').toString()
	const options = {}
	const exception = nunjucks.renderString(exceptionTpl, options)
	fs.writeFileSync(`./${projectName}/src/lib/exception.js`, exception)
}
