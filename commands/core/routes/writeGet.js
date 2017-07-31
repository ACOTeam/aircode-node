const fs = require('fs')
const nunjucks = require('nunjucks')

module.exports = (projectName, resource) => {
	const getTpl = fs.readFileSync(__dirname + '/tpls/routes/get.js.tpl').toString()
	const options = { }
	const get = nunjucks.renderString(getTpl, options)
	fs.writeFileSync(`./${projectName}/src/routes/${resource}/get.js`, get)
}
