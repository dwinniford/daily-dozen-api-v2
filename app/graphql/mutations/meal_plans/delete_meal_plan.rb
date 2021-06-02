module Mutations 
    module MealPlans
        class DeleteMealPlan < BaseMutation
            description "delete meal plan for user"

            # inputs
            argument :id, ID, required: true 

            #outputs 
            field :success, Boolean, null: false 

            def resolve(id)
                authenticate_user
                meal_plan = context[:current_user].meal_plans.find(id)
                if meal_plan && meal_plan.destroy
                    {success: true}
                else
                    raise GraphQL::ExecutionError.new("there was an error deleting the meal plan")
                end
            end
        end
    end
end
