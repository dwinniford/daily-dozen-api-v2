require 'rails_helper'

module Mutations 
    module MealPlans 
        RSpec.describe CreateMealPlan, type: :request do 
            describe '.resolve' do 
                it 'creates a users meal plan with tags and recipes' do 
                    user = FactoryBot.create(:user)
                    # method from rails helper
                    headers = sign_in_test_headers user 

                    query = <<~GQL 
                    mutation {
                        createMealPlan(input: {
                                title: "test meal plan", 
                                recipes: [
                                    {label: "Recipe 1 Label", url: "testurl"}
                                ],
                                tags: [
                                    {recipeUrl: "testurl", parent: "berries", ingredient: "raspberry", servings: 1}
                                ]
                            }) {
                            mealPlan {
                                id
                                recipes {
                                    label
                                    url
                                    id
                                }
                                tags {
                                    recipeUrl
                                    parent
                                    ingredient
                                    servings
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
                    expect(json['data']['createMealPlan']['mealPlan']['id']).not_to be_nil 
                    expect(json['data']['createMealPlan']['mealPlan']['recipes'][0]['id']).not_to be_nil
                    expect(json['data']['createMealPlan']['mealPlan']['tags'][0]['id']).not_to be_nil
                end
                
                it 'creates a users meal plan without tags and recipes' do 
                    user = FactoryBot.create(:user)
                    # method from rails helper
                    headers = sign_in_test_headers user 

                    query = <<~GQL 
                    mutation {
                        createMealPlan(input: {
                                title: "test meal plan"
                            }) {
                            mealPlan {
                                id                               
                            }
                        }
                    }
                    GQL
                    post '/graphql', params: {query: query}, headers: headers
                    expect(response).to have_http_status(200)
                    json = JSON.parse(response.body)
                    # byebug
                    expect(json['data']['createMealPlan']['mealPlan']['id']).not_to be_nil 
                end 
            end
        end
    end

end