module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false, description: "MongoDB User id string"
    field :name, String, null: false, description: "User's name"
    field :meal_plans, [Types::MealPlanType], null: true, description: "Users MealPlans"
  end
end
