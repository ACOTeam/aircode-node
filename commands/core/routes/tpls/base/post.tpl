router.post('/{{resource}}s', validator({
  body: Joi.object().keys({
    {% for key in keys %}
    {{key}}: Joi.{{fields[key].toLowerCase()}}().required(),
    {%endfor%}
  })
}), require('./{{resource}}s/post'))

