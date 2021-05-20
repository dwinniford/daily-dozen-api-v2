require "rails_helper"

module Queries 
    module Users
        RSpec.describe Me, type: :request do 
            describe '.resolve' do 
                it "returns the logged in users data" do 
                    user = FactoryBot.create(:user)
                    headers = sign_in_test_headers user 
                    query = <<~GQL 
                    query {
                        me {
                            name
                            id
                        }
                    }
                    GQL
                    post '/graphql', params: {query: query}, headers: headers 
                    expect(response).to have_http_status(200)
                    json = JSON.parse(response.body)
                    expect(json["data"]["me"]["id"]).to eql user.id.to_s 
                end
            end
        end 
    end
end