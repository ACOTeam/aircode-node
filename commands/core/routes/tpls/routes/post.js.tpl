const db = require('../../runtime/db')

const {{model}} = db.{{model}}

module.exports = async(ctx, next) => {
  const {{fields}} = ctx.request.body
  const data = {{fields}}
  const {{resource}} = await {{model}}.create(data)
  ctx.apiSuccess({{resource}})
}
