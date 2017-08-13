const db = require('../../runtime/db')
const Exception = require('../../lib/exception')

const {{model}} = db.{{model}}

module.exports = async(ctx, next) => {
  const _id = ctx.params._id
  const {{resource}} = await {{model}}.findOneAndUpdate({ _id, isDeleted: false }, { '$set': { isDeleted: true } })
  if (!{{resource}}) throw new Exception(404, `Cannot find {{resource}}: ${_id}`)
  ctx.apiSuccess('Success to delete.')
}
