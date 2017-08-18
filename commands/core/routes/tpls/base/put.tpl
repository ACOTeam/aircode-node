/**
  @api {put} /{{resource.toLowerCase()}}s/:_id
  @apiName Put{{resource}}
  @apiVersion 0.1.0
  @apiGroup {{resource}}
  @apiPermission public
  @apiDescription
      update entity by id
  @apiBody
  {
    {% for key in keys %}
    {{key}}?: {{fields[key].toLowerCase()}}
    {%endfor%}
  }
*/
router.put('/{{resource.toLowerCase()}}s/:_id', validator({
  params: Joi.object().keys({
    _id: Joi.objectId().required()
  }),
  body: Joi.object().keys({
    {% for key in keys %}
    {{key}}: Joi.{{fields[key].toLowerCase()}}().required(),
    {%endfor%}
  })
}), require('./{{resource.toLowerCase()}}s/put'))

