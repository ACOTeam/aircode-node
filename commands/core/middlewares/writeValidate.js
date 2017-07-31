const fs = require('fs')
const nunjucks = require('nunjucks')

module.exports = (projectName) => {
	const validateTpl = fs.readFileSync(__dirname + '/tpls/validate.js.tpl').toString()
	const options = {}
	const validate = nunjucks.renderString(validateTpl, options)
	fs.writeFileSync(`./${projectName}/src/middlewares/validate.js`, validate)
}
