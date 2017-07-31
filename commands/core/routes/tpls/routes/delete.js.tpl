module.exports = (ctx, next) => {
  const id = ctx.params.id
  ctx.apiSuccess(`Success to delete: ${id}`)
}
