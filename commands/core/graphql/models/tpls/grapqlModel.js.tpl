const Graphql = require('graphql')

module.exports = new Graphql.GraphQLObjectType({
  name: '{{resource}}',
  description: 'Search {{resource}}s',
  fields: {
    _id: {
      type: Graphql.GraphQLString
    },
    {% for key in keys -%}
    {{key}}: {
      type: Graphql.GraphQL{{mongoToGraphqlMaps[fields[key]]}}
    },
    {% endfor -%}
  }
})
