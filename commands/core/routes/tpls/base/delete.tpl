/**
  @api {delete} /{{resource.toLowerCase()}}s/:_id
  @apiName Delete{{resource}}
  @apiVersion 0.1.0
  @apiGroup {{resource}}
  @apiPermission public
  @apiDescription
    update entity by id
*/
router.delete('/{{resource}}s/:_id', validator({
  params: Joi.object().keys({
    _id: Joi.objectId().required()
  })
}), require('./{{resource.toLowerCase()}}s/delete'))
