module Types
  class RecipeType < Types::BaseObject
    field :id, ID, null: false, description: "mongo db id for recipe"
    field :label, String, null: false, description: "Label of the recipe"
    field :url, String, null: false, description: "url of the recipe"
    field :source, String, null: false, description: "Name of the source for the recipe"
    field :ingredient_lines, [String], null: false, description: "List of ingredients for the recipe"
    field :image, String, null: false, description: "Image for the recipe"
    field :meal_plan, Types::MealPlanType, null: true, description: "Parent meal plan of the recipe"
  end
end
