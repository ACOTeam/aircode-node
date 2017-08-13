module.exports = (query, args) => {
  if ('sort' in args) {
    query = query.sort(args.sort)
  }

  if ('limit' in args) {
    query = query.limit(parseInt(args.limit))
  }

  if ('offset' in args) {
    query = query.skip(parseInt(args.offset))
  }

  delete args.sort
  delete args.limit
  delete args.offset
  delete args.key
  query = query.where(args)

  return query
}
