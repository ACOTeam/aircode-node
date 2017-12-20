const db = require('../../runtime/db')
const Exception = require('../../lib/exception')

const {{model}} = db.{{model}}

module.exports = async(ctx, next) => {
  const data = ctx.request.body
  const _id = ctx.params._id
  const {{resource}} = await {{model}}.findOneAndUpdate({ _id, isDeleted: false }, { '$set': data }, { new: true })
  if (!{{resource}}) throw new Exception(`Cannot find {{resource}}: ${_id}`)
  ctx.apiSuccess({{resource}})
}
