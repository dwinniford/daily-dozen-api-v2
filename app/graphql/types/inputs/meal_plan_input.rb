module Types
    module Inputs 
        class MealPlanInput < BaseInputObject
            argument :title, String, required: true, description: "Meal Plan title"
            # only use input types here
            argument :recipes, [Types::Inputs::RecipeInput], required: false, description: "List of recipes in the meal plan"
            argument :tags, [Types::Inputs::TagInput], required: false, description: "list of tags in the meal plan"
        end
    end
end