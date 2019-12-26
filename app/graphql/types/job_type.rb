require './app/graphql/types/apply_type.rb'
require './app/graphql/types/company_type.rb'


JobType = GraphQL::ObjectType.define do
  name 'Job'
  description 'A Job Type'
  field :id, types.ID
  field :name, types.String
  field :place, types.String
  field :company_id, types.ID

  field :applies do
    type types[ApplyType] # types declaration for collection
    argument :size,
             types.Int,
             default_value: 15
    resolve ->(job, args, ctx) {
      job.applies.limit(args[:size]).order(id: :asc) # :desc
    }
  end
  field :company, CompanyType
end
