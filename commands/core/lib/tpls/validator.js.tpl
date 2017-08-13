const joi = require('joi')
const Exception = require('../lib/exception')

module.exports = function validator (schema) {
  return async(ctx, next) => {
    if (schema.body) {
      const result = joi.validate(ctx.request.body, schema.body)
      if (result.error) {
        return ctx.apiError(new Exception(2001, result.error.message))
      }
    }
    if (schema.params) {
      const result = joi.validate(ctx.params, schema.params)
      if (result.error) {
        return ctx.apiError(new Exception(2001, result.error.message))
      }
    }
    if (schema.query) {
      const result = joi.validate(ctx.query, schema.query)
      if (result.error) {
        return ctx.apiError(new Exception(2001, result.error.message))
      }
    }
    if (schema.header) {
      const result = joi.validate(ctx.headers, schema.header, {allowUnknown: true})
      if (result.error) {
        return ctx.apiError(new Exception(2001, result.error.message))
      }
    }
    await next()
  }
}
