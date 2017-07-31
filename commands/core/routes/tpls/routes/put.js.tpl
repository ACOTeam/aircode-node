module.exports = (ctx, next) => {
  const id = ctx.params.id
  const title = ctx.request.body.title
  ctx.apiSuccess(`Success to update todo: ${id} - ${title}`)
}
