module Types
  class MealPlanType < Types::BaseObject
    field :id, ID, null: true, description: "MongoDB MealPlan id string"
    field :title, String, null: true, description: "Title of the MealPlan"
    field :user, Types::UserType, null: true, description: "User of the MealPlan"
    field :recipes, [Types::RecipeType], null: true, description: "Recipes for the meal plan"
    field :tags, [Types::TagType], null: true, description: "Tags for the meal plan"
  end
end
