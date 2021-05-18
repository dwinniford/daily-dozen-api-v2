module Queries
    module Users
        class Me < BaseQuery
            definition "show logged in user"

            # outputs
            type Types::UserType, null: false
            
            def resolve
                authenticate_user
                context[:current_user]
            end
        end
    end
end