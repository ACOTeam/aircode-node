router.delete('/{{resource}}/:id', Validate({
	params: Joi.object().keys({
		id: Joi.number().required()
	})
}), require('./{{resource}}/delete'))

