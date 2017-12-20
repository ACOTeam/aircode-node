module.exports = () => {
  return async(ctx, next) => {
    ctx.apiSuccess = (data, exData = {}) => {
      ctx.body = Object.assign({
        status: 'OK',
        code: 200,
        server_time: Date.now(),
        data: data
      }, exData)
    }

    ctx.apiError = (err) => {
      ctx.body = {
        status: 'Error',
        error_code: err.error_code || 500,
        error_msg: err.error_msg || err.toString(),
        error_extra: err.error_extra || '',
        server_time: Date.now()
      }
    }
    await next()
  }
}
