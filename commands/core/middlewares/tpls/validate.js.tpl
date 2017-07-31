const Joi = require('joi')
const Exception = require('../lib/exception')

module.exports = function Validation (schema) {
  return (ctx, next) => {
    let result = {}
    if (schema.body) {
      result = Joi.validate(ctx.body, schema.body)
      if (result.error) {
        return ctx.apiError(new Exception(2001, result.error.message))
      }
    }
    if (schema.params) {
      result = Joi.validate(ctx.params, schema.params)
      if (result.error) {
        return ctx.apiError(new Exception(2001, result.error.message))
      }
    }
    if (schema.query) {
      result = Joi.validate(ctx.query, schema.query)
      if (result.error) {
        return ctx.apiError(new Exception(2001, result.error.message))
      }
    }
    if (schema.header) {
      result = Joi.validate(ctx.headers, schema.header, {allowUnknown: true})
      if (result.error) {
        return ctx.apiError(new Exception(2001, result.error.message))
      }
    }
    next()
  }
}
