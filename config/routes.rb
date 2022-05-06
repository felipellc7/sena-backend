Rails.application.routes.draw do
  namespace :api do
    namespace :v1, constraints: ApiVersion.new('v1', true) do
      # Sign in
      post '/sign_in', to: 'authentication#sign_in'

      # Quer to users
      get '/users', to: 'users#index'
    end
  end
end