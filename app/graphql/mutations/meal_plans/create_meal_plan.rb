module Mutations
    module MealPlans
        class CreateMealPlan < BaseMutation
            description "Create meal plan for the user"

            #inputs
            argument :input, Types::Inputs::MealPlanInput, required: true 

            #outputs
            field :meal_plan, Types::MealPlanType, null: true 

            def resolve(input: nil)
                # byebug
                authenticate_user
                
                meal_plan = context[:current_user].meal_plans.build(title: input.title)
                input.recipes.each { |r|
                    meal_plan.recipes.build(r.to_h)
                }
                input.tags.each { |t| 
                    meal_plan.tags.build(t.to_h)
                }
                if meal_plan.save 
                    {meal_plan: meal_plan}
                else
                    raise GraphQL::ExecutionError.new(meal_plan.errors.full_messages.join(","))
                end
            end
            
        end
    end
end