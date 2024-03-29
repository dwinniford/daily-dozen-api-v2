module Types
  class MutationType < Types::BaseObject
    # Auth
    field :sign_up, mutation: Mutations::Auth::SignUp
    field :sign_in, mutation: Mutations::Auth::SignIn

    # MealPlans
    field :create_meal_plan, mutation: Mutations::MealPlans::CreateMealPlan
    field :delete_meal_plan, mutation: Mutations::MealPlans::DeleteMealPlan
    field :update_meal_plan, mutation: Mutations::MealPlans::UpdateMealPlan

    #Recipes
    field :create_recipe, mutation: Mutations::Recipes::CreateRecipe
    field :delete_recipe, mutation: Mutations::Recipes::DeleteRecipe

    #Tags
    field :create_tag, mutation: Mutations::Tags::CreateTag
    field :delete_tag, mutation: Mutations::Tags::DeleteTag
  end
end
