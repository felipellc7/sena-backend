Rails.application.routes.draw do
  namespace :api do
    namespace :v1, constraints: ApiVersion.new('v1', true) do
      # Sign in
      post '/sign_in', to: 'authentication#sign_in'
      get '/entities_count', to: 'helpers#counter_entities'

      resources :users, param: :dni
      resources :patients, param: :dni
      resources :specialties
      resources :doctors, param: :dni
      resources :consulting_rooms
      resources :schedules
      resources :appointments
    end
  end
end