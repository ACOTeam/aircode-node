router.put('/{{resource}}/:id', Validate({
	params: Joi.object().keys({
		id: Joi.number().required()
	}),
	body: Joi.object().keys({
		title: Joi.string().required()
	})
}), require('./{{resource}}/put'))

