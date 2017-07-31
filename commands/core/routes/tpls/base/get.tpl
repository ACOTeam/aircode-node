router.get('/{{resource}}/:id', Validate({
  params: Joi.object().keys({
    id: Joi.number().required()
  })
}), require('./{{resource}}/get'))

