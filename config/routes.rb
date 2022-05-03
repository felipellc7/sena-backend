Rails.application.routes.draw do
  namespace :api do
    namespace :v1, constraints: ApiVersion.new('v1', true) do
      # Routes here...
    end
  end
end