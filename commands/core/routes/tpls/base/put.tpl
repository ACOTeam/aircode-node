router.put('/{{resource}}s/:_id', validator({
  params: Joi.object().keys({
    _id: Joi.objectId().required()
  }),
  body: Joi.object().keys({
    {% for key in keys %}
    {{key}}: Joi.{{fields[key].toLowerCase()}}().required(),
    {%endfor%}
  })
}), require('./{{resource}}s/put'))

