const fs = require('fs')
const nunjucks = require('nunjucks')

module.exports = (projectName) => {
	const dbTpl = fs.readFileSync(__dirname + '/tpls/db.js.tpl').toString()
	const options = {}
	const db = nunjucks.renderString(dbTpl, options)
	fs.writeFileSync(`./${projectName}/src/runtime/db.js`, dbTpl)
}