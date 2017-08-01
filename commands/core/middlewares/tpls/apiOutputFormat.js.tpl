module.exports = () => {
  return (ctx, next) => {
    ctx.apiSuccess = (data, exData = {}) => {
      ctx.body = Object.assign({
        status: 'OK',
        code: 200,
        data: data,
        server_time: Date.now()
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
    next()
  }
}
