Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphql',graphql_path:"graphql#execute"
  end
  post "/graphql", to: "graphql#execute"
  get '/graphql', to: 'graphql#execute'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: 'api' do
    namespace :v1 do
      resources :jobs
      resources :companies do
        resources :jobs
      end
    end
  end

  match "*path", to: "application#catch_404", via: :all
end
