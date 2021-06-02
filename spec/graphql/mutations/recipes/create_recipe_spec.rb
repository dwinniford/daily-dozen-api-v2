require 'rails_helper'

module Mutations 
    module Recipes 
        RSpec.describe CreateRecipe, type: :request do 
            describe '.resolve' do 
                it "creates a recipe and adds to a meal plan" do 
                    user = FactoryBot.create(:user)
                    meal_plan = user.meal_plans.build(title: "test title")
                    meal_plan.save 

                    headers = sign_in_test_headers user 

                    query = <<~GQL
                    mutation {
                        createRecipe(input: {label: "test label", url: "test url", mealPlanId: "#{meal_plan.id}" }) {
                            recipe {
                                label
                                url
                                id
                            }
                        }
                    }
                    GQL

                    post '/graphql', params: {query: query}, headers: headers 
                    expect(response).to have_http_status(200)
                    json = JSON.parse(response.body)
                    # byebug
                    expect(json['data']['createRecipe']['recipe']['id']).not_to be_nil
                end
            end
        end
    end
end