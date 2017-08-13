router.post('/{{resource}}s', validator({
  body: Joi.object().keys({
    title: Joi.string().required(),
    price: Joi.number().required()
  })
}), require('./{{resource}}s/post'))

