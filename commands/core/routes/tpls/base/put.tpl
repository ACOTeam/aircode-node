router.put('/{{resource}}s/:_id', validator({
  params: Joi.object().keys({
    _id: Joi.objectId().required()
  }),
  body: Joi.object().keys({
    title: Joi.string().required(),
    price: Joi.number().required()
  })
}), require('./{{resource}}s/put'))

