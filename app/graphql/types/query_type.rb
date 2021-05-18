module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    # do i need to remove these includes?
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :me, resolver: Queries::Users::Me 
    field :user_meal_plans, resolver: Queries::MealPlans::UserMealPlans
    field :meal_plan_show, resolver: Queries::MealPlans::MealPlanShow
  end
end
