router.get('/{{resource}}s', validator({
  query: Joi.object().keys({
    limit: Joi.number(),
    skip: Joi.number()
  })
}), require('./{{resource}}s/list'))

