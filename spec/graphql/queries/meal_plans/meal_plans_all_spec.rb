module Queries
    module MealPlans 
        RSpec.describe MealPlansAll, type: :request do 
            describe '.resolve' do 
                it 'returns a list of all meal plans with most recent meal plans at the end' do
                    user = FactoryBot.create(:user)
                    meal_plan_1 = FactoryBot.create(:meal_plan, user_id: user.id)
                    meal_plan_2 = FactoryBot.create(:meal_plan, title: "second meal plan title", user_id: user.id)
                    headers = sign_in_test_headers user 
                    query = <<~GQL
                    query {
                        mealPlansAll {
                            title
                            id
                        }
                    }
                    GQL
                    post '/graphql', params: {query: query}, headers: headers 
                    expect(response).to have_http_status(200)
                    json = JSON.parse(response.body)
                    # byebug
                    # currently the test database is not cleaned up after each test
                    # should the database be cleared routinely
                    # how should i test this
                    # check the last item in the array
                    expect(json['data']['mealPlansAll'][-2]['id']).to eql meal_plan_1.id.to_s
                end
            end
        end
    end
end