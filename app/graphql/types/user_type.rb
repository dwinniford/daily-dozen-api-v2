module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false, description: "MongoDB User id string"
    field :name, String, null: false, description: "User's name"
  end
end
