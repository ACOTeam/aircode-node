router.get('/{{resource}}s/:_id', validator({
  params: Joi.object().keys({
    _id: Joi.objectId().required()
  })
}), require('./{{resource}}s/get'))

