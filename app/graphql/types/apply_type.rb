ApplyType = GraphQL::ObjectType.define do
  name 'Apply'
  description 'An Apply Type'
  field :id, types.ID
  field :job_id, types.ID
  field :geek_id, types.ID
  field :read, types.Boolean
  field :invited, types.Boolean
end