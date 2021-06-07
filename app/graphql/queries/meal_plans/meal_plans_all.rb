module Queries
    module MealPlans
        class MealPlansAll < BaseQuery 
            description "get all meal plans"

            type [Types::MealPlanType], null: true 

            def resolve 
                authenticate_user
                # byebug
                MealPlan.all.to_a
            end
        end
    end
end