module.exports = function () {
	return function (ctx, next) {
		ctx.apiSuccess = (data) => {
			ctx.body = {
				status: 'OK',
				code: 200,
				data: data,
				server_time: Date.parse(new Date())
			}
		}

		ctx.apiError = (err) => {
			ctx.body = {
				status: 'Error',
				error_code: err.error_code || 500,
				error_msg: err.error_msg || err.toString(),
				error_extra: err.error_extra || '',
				server_time: Date.parse(new Date())
			}
		}
		next()
	}
}