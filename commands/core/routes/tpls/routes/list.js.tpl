const db = require('../../runtime/db')

const {{model}} = db.{{model}}

module.exports = async(ctx, next) => {
  const limit = parseInt(ctx.query.limit)
  const skip = parseInt(ctx.query.skip)
  const {{resource}}s = await {{model}}.find({}).limit(limit || 0).skip(skip || 0)
  ctx.apiSuccess({{resource}}s)
}
