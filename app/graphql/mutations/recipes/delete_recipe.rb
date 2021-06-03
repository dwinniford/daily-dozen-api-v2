module Mutations
    module Recipes 
        class DeleteRecipe < BaseMutation
            description "delete recipe from a users meal plan"
            
            argument :meal_plan_id, ID, required: true 
            argument :recipe_id, ID, required: true

            field :success, Boolean, null: false 

            def resolve(meal_plan_id: nil, recipe_id: nil)
                authenticate_user
                meal_plan = context[:current_user].meal_plans.find(meal_plan_id)
                recipe = meal_plan.recipes.find(recipe_id)
                if recipe && recipe.destroy
                    {success: true}
                else
                    raise GraphQL:ExecutionError.new("there was an error deleting the recipe")
                end
            end

        end
    end
end