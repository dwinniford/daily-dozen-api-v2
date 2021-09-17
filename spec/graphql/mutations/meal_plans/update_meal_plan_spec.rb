require 'rails_helper'
module Mutations
    module MealPlans
        RSpec.describe UpdateMealPlan, type: :request do 
            describe '.resolve' do 
                it 'updates meal plan with provided title' do 
                    user = FactoryBot.create(:user)
                    meal_plan = FactoryBot.create(:meal_plan, user_id: user.id)

                    headers = sign_in_test_headers user 
                    query = <<~GQL
                    mutation {
                        updateMealPlan(id: "#{meal_plan.id}", title: "my new title") {
                            mealPlan {
                                title
                                id
                            }
                        }
                    }
                    GQL
                    post '/graphql', params: {query: query}, headers: headers
                    expect(response).to have_http_status(200)
                    json = JSON.parse(response.body)
                    expect(json["data"]["updateMealPlan"]["mealPlan"]["title"]).to eq('my new title')
                end
            end
        end
    end
end