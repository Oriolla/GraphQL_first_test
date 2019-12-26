# class GraphQLAppSchema < GraphQL::Schema
#   mutation(Types::MutationType)
#   query(Types::QueryType)
# end
GraphQLAppSchema = GraphQL::Schema.define do

  mutation(Types::MutationType)
  rescue_from(ActiveRecord::RecordNotFound) { 'Not found' }
  query Types::QueryType
  # subscription
end



