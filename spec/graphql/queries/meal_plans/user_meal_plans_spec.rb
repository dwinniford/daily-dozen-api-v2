require 'rails_helper'

module Queries 
    module MealPlans
        RSpec.describe UserMealPlans, type: :request do
            describe '.resolve' do
                it 'lists meal plans of the current user' do 
                    user = FactoryBot.create(:user)
                    meal_plan = FactoryBot.create(:meal_plan, user_id: user.id, title: "user meal plan 1")
                    headers = sign_in_test_headers user 
                    query = <<~GQL
                    query {
                        userMealPlans {
                            id
                            title
                        }
                    }
                    GQL
                    post '/graphql',params: {query: query}, headers: headers
                    expect(response).to have_http_status(200)
                    json = JSON.parse(response.body)
                    expect(json["data"]["userMealPlans"][0]["id"]).to eql meal_plan._id.to_s
                end
            end
        end
    end
end