require 'rails_helper'

module Mutations 
    module Recipes 
        RSpec.describe DeleteRecipe, type: :request do 
            describe '.resolve' do 
                it 'deletes a recipe from a meal plan' do 
                    user = FactoryBot.create(:user)
                    meal_plan = FactoryBot.create(:meal_plan, user_id: user.id)
                    recipe = meal_plan.recipes.create(FactoryBot.attributes_for(:recipe))
                    headers = sign_in_test_headers user 

                    query = <<~GQL
                    mutation {
                        deleteRecipe(mealPlanId: "#{meal_plan.id}", recipeId: "#{recipe.id}") {
                            success
                        }
                    }
                    GQL
                    post '/graphql', params: {query: query}, headers: headers 
                    expect(response).to have_http_status(200)
                    json = JSON.parse(response.body)
                    expect(json['data']['deleteRecipe']['success']).to be_truthy
                end
            end
        end
    end
end