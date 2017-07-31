const fs = require('fs')
const nunjucks = require('nunjucks')

module.exports = (projectName) => {
	const apiOutputFormatTpl = fs.readFileSync(__dirname + '/tpls/apiOutputFormat.js.tpl').toString()
	const options = {}
	const apiOutputFormat = nunjucks.renderString(apiOutputFormatTpl, options)
	fs.writeFileSync(`./${projectName}/src/middlewares/apiOutputFormat.js`, apiOutputFormat)
}