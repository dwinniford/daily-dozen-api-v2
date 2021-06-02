module Mutations 
    module Recipes
        class CreateRecipe < BaseMutation
            description "create recipe for an existing meal plan"
            
            argument :input, Types::Inputs::RecipeInput, required: true 

            field :recipe, Types::RecipeType, null: false

            def resolve(input: nil)
                authenticate_user

                meal_plan = context[:current_user].meal_plans.find(input.meal_plan_id)
                if meal_plan
                    recipe = meal_plan.recipes.build(input.to_h)
                    if recipe.save 
                        {recipe: recipe}
                    else
                        raise GraphQL::ExecutionError.new(recipe.errors.full_messages.join(", "))
                    end
                else
                    raise GraphQL::ExecutionError.new("meal plan not found")
                end

            end
        end
    end
end 