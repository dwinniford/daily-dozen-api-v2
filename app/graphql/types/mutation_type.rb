module Types
  class MutationType < Types::BaseObject
    # Auth
    field :sign_up, mutation: Mutations::Auth::SignUp
    field :sign_in, mutation: Mutations::Auth::SignIn

    # MealPlans
    field :create_meal_plan, mutation: Mutations::MealPlans::CreateMealPlan
    field :delete_meal_plan, mutation: Mutations::MealPlans::DeleteMealPlan
  end
end
