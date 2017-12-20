const db = require('../../runtime/db')

const {{model}} = db.{{model}}

module.exports = async(ctx, next) => {
  const data = ctx.request.body
  const {{resource}} = await {{model}}.create(data)
  ctx.apiSuccess({{resource}})
}
