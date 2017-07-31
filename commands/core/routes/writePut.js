const fs = require('fs')
const nunjucks = require('nunjucks')

module.exports = (projectName, resource) => {
	const putTpl = fs.readFileSync(__dirname + '/tpls/routes/put.js.tpl').toString()
	const options = { }
	const put = nunjucks.renderString(putTpl, options)
	fs.writeFileSync(`./${projectName}/src/routes/${resource}/put.js`, put)
}
