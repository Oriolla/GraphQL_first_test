# module Types
#   class QueryType < Types::BaseObject
#     # Add root-level fields here.
#     # They will be entry points for queries on your schema.
#
#     # TODO: remove me
#     field :test_field, String, null: false,
#       description: "An example field added by the generator"
#     def test_field
#       "Hello World!"
#     end
#   end
# end
require './app/graphql/types/company_type.rb'
require './app/graphql/types/job_type.rb'
require './app/graphql/types/apply_type.rb'
require './app/graphql/types/geek_type.rb'

Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The query root for GraphQLAppshareSchema'
  # root-level fields here.
  # Entry points for queries on TimeshareSchema.

  # All companies
  field :all_companies do
    type types[CompanyType] # types declaration for collection
    description 'All Companies'
    argument :size, types.Int,
             default_value: 15
    resolve ->(obj, args, ctx) {
      Company.all.limit(args[:size]).order(id: :asc)
    }
  end



  # {
  #     company:company (id:1){
  #     id,
  #     name,
  #     location,
  #     jobs:jobs{id,company_id,name}
  # }
  # }
  # One company
  field :company do
    type CompanyType
    argument :id, !types.ID
    description 'One Company by ID'
    resolve -> (obj, args, ctx) {
      Company.find(args[:id])
    }
  end

  # All jobs
  field :all_jobs do
    type types[JobType] # types declaration for collection
    description 'All Jobs'
    argument :size, types.Int,
             default_value: 15
    resolve ->(obj, args, ctx) {
      Job.all.limit(args[:size]).order(id: :asc)
    }
  end
  # {
  #     job:job(id:1) {
  #       id,
  #           name,
  #           company_id,
  #           company:company{location,id,name},
  #           applies:applies{id,geek_id}
  #     }
  # }
  #http://localhost:3000/graphql?query={job:job(id:2){name,place}}
  # One job
  field :job do
    type JobType
    argument :id, !types.ID
    description 'One Job by ID'
    resolve -> (obj, args, ctx) {
      Job.find(args[:id])
    }
  end



  # TODO: remove me
  field :testField, types.String do
    description 'An example field added by the generator'
    resolve ->(obj, args, ctx) {
      'Hello World!'
    }
  end
end
