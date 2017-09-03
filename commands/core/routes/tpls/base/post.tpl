/**
  @api {post} /{{resource.toLowerCase()}}s
  @apiName Post{{resource}}
  @apiVersion 0.1.0
  @apiGroup {{resource}}
  @apiPermission public
  @apiDescription
      create an entity
  @apiBody
  {
    {% for key in keys -%}
    {{key}}: {{fields[key].toLowerCase()}}
    {%endfor-%}
  }
*/
router.post('/{{resource.toLowerCase()}}s', validator({
  body: Joi.object().keys({
    {% for key in keys -%}
    {{key}}: Joi.{{fields[key].toLowerCase()}}().required(),
    {%endfor-%}
  })
}), require('./{{resource.toLowerCase()}}s/post'))

