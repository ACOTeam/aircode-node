module.exports = async (ctx, next) => {
  const title = ctx.request.body
  ctx.apiSuccess(`Success to create todo: ${JSON.stringify(title)}`)
}
