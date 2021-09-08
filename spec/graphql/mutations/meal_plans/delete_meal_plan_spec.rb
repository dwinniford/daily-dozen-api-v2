require 'rails_helper'

module Mutations
    module MealPlans 
        RSpec.describe DeleteMealPlan, type: :request do 
            describe '.resolve' do 
                it 'deletes a users meal plan' do 
                    user = FactoryBot.create(:user)
                    meal_plan = FactoryBot.create(:meal_plan, user_id: user.id)
                    meal_plan.recipes.create(FactoryBot.attributes_for(:recipe)) 
                    meal_plan.tags.create(FactoryBot.attributes_for(:tag))
                    headers = sign_in_test_headers user 
                    query = <<~GQL 
                    mutation {
                        deleteMealPlan(id: "#{meal_plan.id}") {
                            success
                        }
                    }
                    GQL
                    post '/graphql', params: {query: query}, headers: headers
                    expect(response).to have_http_status(200)
                    json = JSON.parse(response.body)
                    expect(json["data"]["deleteMealPlan"]["success"]).to be_truthy
                    # byebug
                    
                end 
            end 
        end
    end
end