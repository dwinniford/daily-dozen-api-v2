module Mutations
  # class BaseMutation < GraphQL::Schema::RelayClassicMutation
  class BaseMutation < GraphQL::Schema::Mutation
    # argument_class Types::BaseArgument
    # field_class Types::BaseField
    # input_object_class Types::BaseInputObject
    # object_class Types::BaseObject
    null false 
    # authenticates the token
    def authenticate_user 
      unless context[:current_user]
        raise GraphQL::ExecutionError.new("You must be logged in to perform this action.")
      end
      
    end
  end
end
