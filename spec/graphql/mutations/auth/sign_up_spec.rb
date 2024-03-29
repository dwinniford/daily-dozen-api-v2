require 'rails_helper'

module Mutations
  module Auth
    RSpec.describe SignUp, type: :request do
      describe '.resolve' do
        it 'create a user and signs in the user' do
          params = FactoryBot.attributes_for(:user)
          query = <<~GQL
          mutation {
            signUp(input: {name: "#{params[:name]}", password: "#{params[:password]}"}) {
              token
              user {
                id
                name
              }
            }
          }
          GQL
          post '/graphql', params: {query: query}
          expect(response).to have_http_status(200)
          json = JSON.parse(response.body)
          # byebug
          expect(json["data"]["signUp"]["token"]).not_to be_nil
        end
      end
    end
  end
end