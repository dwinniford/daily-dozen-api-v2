module Types
    module Inputs 
        class MealPlanInput < BaseInputObject
            argument :title, String, required: true, description: "Meal Plan title"
        end
    end
end