module Mutations 
    module Tags
        class CreateTag < BaseMutation
            description "create tag for an existing meal plan"

            argument :input, Types::Inputs::TagInput, required: true

            field :tag, Types::TagType, null: false 

            def resolve(input:)
                authenticate_user

                meal_plan = context[:current_user].meal_plans.find(input.meal_plan_id)
                if meal_plan
                    tag = meal_plan.tags.build(input.to_h.except(:meal_plan_id))
                    if tag.save 
                        {tag: tag}
                    else
                        GraphQL::ExecutionError.new(tag.errors.full_messages.join(', '))
                    end
                else
                    GraphQL::ExecutionError.new("meal plan could not be found")
                end
            end
        end
    end
end