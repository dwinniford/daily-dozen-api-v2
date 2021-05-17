module Queries 
    module MealPlans
        class UserMealPlans < BaseQuery 
            description "get the current user meal plans"
            
            type [Types::MealPlanType], null: true 

            def resolve 
                authenticate_user
                # update to allow users to view other user meal plans
                context[:current_user].meal_plans
            end
        end
    end
end