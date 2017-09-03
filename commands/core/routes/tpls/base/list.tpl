/**
  @api {get} /{{resource.toLowerCase()}}s
  @apiName List{{resource}}s
  @apiVersion 0.1.0
  @apiGroup {{resource}}
  @apiPermission public
  @apiDescription
      get entity list
*/
router.get('/{{resource.toLowerCase()}}s', validator({
  query: Joi.object().keys({
    limit: Joi.number(),
    skip: Joi.number()
  })
}), require('./{{resource.toLowerCase()}}s/list'))

