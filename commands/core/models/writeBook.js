const fs = require('fs')
const nunjucks = require('nunjucks')

module.exports = (projectName) => {
  const bookTpl = fs.readFileSync(__dirname + '/tpls/book.js.tpl').toString()
  const options = {}
  const book = nunjucks.renderString(bookTpl, options)
  fs.writeFileSync(`./${projectName}/src/models/Book.js`, book)
}
