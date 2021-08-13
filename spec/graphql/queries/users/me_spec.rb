require "rails_helper"

module Queries 
    module Users
        RSpec.describe Me, type: :request do 
            describe '.resolve' do 
                it "returns the logged in users data" do 
                    user = FactoryBot.create(:user)
                    meal_plan = FactoryBot.create(:meal_plan, user_id: user.id)
                    recipe = FactoryBot.create(:recipe, meal_plan_id: meal_plan.id)
                    tag = FactoryBot.create(:tag, meal_plan_id: meal_plan.id)
                    headers = sign_in_test_headers user 
                    query = <<~GQL 
                    query {
                        me {
                            name
                            id
                            mealPlans {
                                title
                                id
                                recipes {
                                    label
                                    id
                                }
                                tags {
                                    id
                                }
                            }
                        }
                    }
                    GQL
                    post '/graphql', params: {query: query}, headers: headers 
                    expect(response).to have_http_status(200)
                    json = JSON.parse(response.body)
                    # byebug
                    expect(json["data"]["me"]["id"]).to eql user.id.to_s 
                    expect(json["data"]["me"]["mealPlans"].length).to eql 1
                    expect(json["data"]["me"]["mealPlans"][0]["id"]).to eql meal_plan.id.to_s
                    expect(json["data"]["me"]["mealPlans"][0]["recipes"].length).to eql 1
                    expect(json["data"]["me"]["mealPlans"][0]["recipes"][0]["id"]).to eql recipe.id.to_s
                    expect(json["data"]["me"]["mealPlans"][0]["tags"].length).to eql 1
                    expect(json["data"]["me"]["mealPlans"][0]["tags"][0]["id"]).to eql tag.id.to_s
                end
            end
        end 
    end
end