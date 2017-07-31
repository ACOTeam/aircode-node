const fs = require('fs')
const nunjucks = require('nunjucks')

module.exports = (projectName, resource) => {
	const postTpl = fs.readFileSync(__dirname + '/tpls/routes/post.js.tpl').toString()
	const options = { }
	const post = nunjucks.renderString(postTpl, options)
	fs.writeFileSync(`./${projectName}/src/routes/${resource}/post.js`, post)
}
