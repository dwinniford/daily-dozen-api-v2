module Types 
    module Inputs 
        class RecipeInput < BaseInputObject 
            argument :label, String, required: true, description: "Recipe label"
            argument :url, String, required: true, description: "Recipe url"
            argument :source, String, required: false, description: "Recipe source name"
            argument :image, String, required: false, description: "Recipe image"
            argument :ingredient_lines, [String], required: false, description: "List of recipe ingredients"
            argument :meal_plan_id, ID, required: false, description: "ID of the parent meal plan"
            
        end
    end
end