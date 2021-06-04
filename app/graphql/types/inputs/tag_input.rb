module Types 
    module Inputs
        class TagInput < BaseInputObject 
            argument :recipe_url, String, required: true, description: "url of the related recipe"
            argument :parent, String, required: true, description: "daily dozen parent category name"
            argument :servings, Integer, required: true, description: "number of servings in the recipe"
            argument :ingredient, String, required: true, description: "name of daily dozen item"
            argument :meal_plan_id, ID, required: false, description: "mongo db id of the related meal plan"
        end
    end
end