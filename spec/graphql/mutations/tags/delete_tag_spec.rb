require 'rails_helper'

module Mutations
    module Tags 
        RSpec.describe DeleteTag, type: :request do 
            describe '.resolve' do 
                it 'deletes tag from meal plan' do 
                    user = FactoryBot.create(:user)
                    meal_plan = FactoryBot.create(:meal_plan, user_id: user.id)
                    tag = meal_plan.tags.create(FactoryBot.attributes_for(:tag))
                    headers = sign_in_test_headers user 
                    query = <<~GQL
                    mutation {
                        deleteTag(mealPlanId: "#{meal_plan.id}", tagId: "#{tag.id}") {
                            success
                        }
                    }
                    GQL
                    post '/graphql', params: {query: query}, headers: headers
                    expect(response).to have_http_status(200)
                    json = JSON.parse(response.body)
                    expect(json['data']['deleteTag']['success']).to be_truthy
                end
            end
        end
    end
end