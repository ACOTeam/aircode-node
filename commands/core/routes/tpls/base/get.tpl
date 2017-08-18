/**
  @api {get} /{{resource.toLowerCase()}}s/:_id
  @apiName Get{{resource}}s
  @apiVersion 0.1.0
  @apiGroup {{resource}}
  @apiPermission public
  @apiDescription
      get entity detail
  @apiParams
  {
     _id : string
  }
*/
router.get('/{{resource.toLowerCase()}}s/:_id', validator({
  params: Joi.object().keys({
    _id: Joi.objectId().required()
  })
}), require('./{{resource.toLowerCase()}}s/get'))

