require 'rails_helper'

module Mutations 
    module Tags 
        RSpec.describe CreateTag, type: :request do 
            describe '.resolve' do 
                it 'creates a tag ands adds to the meal plan' do
                    user = FactoryBot.create(:user)
                    meal_plan = FactoryBot.create(:meal_plan, user_id: user.id)
                    headers = sign_in_test_headers user 
                    query = <<~GQL
                    mutation {
                        createTag(input: {
                            recipeUrl: "myurl.com",
                            parent: "berries",
                            ingredient: "raspberry",
                            servings: 1,
                            mealPlanId: "#{meal_plan.id}"
                        }) {
                            tag {
                                ingredient
                                recipeUrl
                                parent
                                servings
                                id
                                mealPlan {
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
                    expect(json['data']['createTag']['tag']['id']).not_to be_nil
                end
            end
        end
    end
end