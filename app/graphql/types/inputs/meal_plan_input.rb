module Types
    module Inputs 
        class MealPlanInput < BaseInputObject
            argument :title, String, required: true, description: "Meal Plan title"
            # don't use the RecipeInputType?
            argument :recipes, [Types::Inputs::RecipeInput], required: false, description: "List of recipes in the meal plan"
        end
    end
end