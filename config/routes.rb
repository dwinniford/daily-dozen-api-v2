Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  if Rails.env.development?
    mount GraphqlPlayground::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

