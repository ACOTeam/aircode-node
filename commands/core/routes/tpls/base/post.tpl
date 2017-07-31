router.post('/{{resource}}', Validate({
	body: Joi.object().keys({
	  title: Joi.string().required()
	})
}), require('./{{resource}}/post'))

