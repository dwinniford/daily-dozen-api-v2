module Types
  class TagType < Types::BaseObject
    field :id, ID, null: false, description: "mongo db id for tag"
    field :recipe_url, String, null: false, description: "url of related recipe"
    field :parent, String, null: false, description: "name of daily dozen parent category"
    field :ingredient, String, null: false, description: "name of daily dozen ingredient"
    field :servings, Integer, null: false, description: "number of servings in the related recipe"
    field :meal_plan, Types::MealPlanType, null: true, description: "meal plan that the tag exists inside of"
  end
end
