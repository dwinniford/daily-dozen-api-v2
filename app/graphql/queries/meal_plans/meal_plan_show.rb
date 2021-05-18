module Queries 
    module MealPlans 
        class MealPlanShow < BaseQuery
            description "get selected meal plan"

            argument :id, ID, required: true, description: "meal plan id"
            # read about type
            type Types::MealPlanType, null: true

            def resolve(id:)
                authenticate_user
                context[:current_user].meal_plans.find(id)
            rescue
                raise GraphQL::ExecutionError.new("meal plan not found")
            end

        end
    end
end