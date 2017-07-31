const fs = require('fs')
const nunjucks = require('nunjucks')

module.exports = (projectName, resource) => {
	const deleteTpl = fs.readFileSync(__dirname + '/tpls/routes/delete.js.tpl').toString()
	const options = { }
	const del = nunjucks.renderString(deleteTpl, options)
	fs.writeFileSync(`./${projectName}/src/routes/${resource}/delete.js`, del)
}