const db = require('../../runtime/db')
const Exception = require('../../lib/exception')

const {{model}} = db.{{model}}

module.exports = async(ctx, next) => {
  const {{fields}} = ctx.request.body
  const _id = ctx.params._id
  const data = {{fields}}
  const {{resource}} = await {{model}}.findOneAndUpdate({ _id, isDeleted: false }, { '$set': data }, { new: true })
  if (!{{resource}}) throw new Exception(`Cannot find {{resource}}: ${_id}`)
  ctx.apiSuccess({{resource}})
}
