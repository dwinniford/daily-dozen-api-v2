require "rails_helper"

module Queries 
    module MealPlans 
        RSpec.describe MealPlanShow, type: :request do 
            describe ".resolve" do 
                it "finds a meal plan by id" do 
                    user = FactoryBot.create(:user)
                    meal_plan = FactoryBot.create(:meal_plan, user_id: user.id, title: "user meal plan 2")
                    headers = sign_in_test_headers user
                    query = <<~GQL
                    query {
                        mealPlanShow(id: "#{meal_plan.id}") {
                            id
                            title
                        }
                    }
                    GQL
                    post '/graphql', params: {query: query}, headers: headers
                    expect(response).to have_http_status(200)
                    json = JSON.parse(response.body)
                    expect(json["data"]["mealPlanShow"]["id"]).to eql meal_plan._id.to_s 

                end
            end   
        end
    end
end