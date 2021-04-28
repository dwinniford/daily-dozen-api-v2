module Types
    module Inputs
      class SignInInput < BaseInputObject
        # graphql_name "UserSignInInput"
        argument :name, String, required: true, description: "User's Name"
        argument :password, String, required: true, description: "Password minimum 5 and maximum 72 characters long"
      end
    end
end