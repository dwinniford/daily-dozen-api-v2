module Mutations 
    module Tags 
        class DeleteTag < BaseMutation 
            description "delete tag from meal plan"

            argument :tag_id, ID, required: true
            argument :meal_plan_id, ID, required: true 

            field :success, Boolean, null: false

            def resolve(tag_id:, meal_plan_id:)
                authenticate_user
                meal_plan = context[:current_user].meal_plans.find(meal_plan_id)
                tag = meal_plan.tags.find(tag_id)
                if tag && tag.destroy 
                    {success: true}
                else
                    raise GraphQL::ExecutionError.new("tag not found")
                end
            end
        end
    end
end