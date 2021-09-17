module Mutations
    module MealPlans 
        class UpdateMealPlan < BaseMutation
            description "update meal plan attributes"

            argument :id, ID, required: true 
            argument :title, String, required: true

            field :meal_plan, Types::MealPlanType, null: true 
            
            def resolve(id: nil, title: nil)
                authenticate_user
                meal_plan = context[:current_user].meal_plans.find(id)
                if meal_plan && meal_plan.update(title: title)
                   {meal_plan: meal_plan}
                else
                    raise GraphQL::ExecutionError.new(meal_plan.errors.full_messages.join(", "))
                end
            end
        end
    end
end