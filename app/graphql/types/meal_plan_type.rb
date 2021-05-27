module Types
  class MealPlanType < Types::BaseObject
    field :id, ID, null: false, description: "MongoDB MealPlan id string"
    field :title, String, null: false, description: "Title of the MealPlan"
    field :user, Types::UserType, null: false, description: "User of the MealPlan"
    field :recipes, [Types::RecipeType], null: true, description: "Recipes for the meal plan"
  end
end
