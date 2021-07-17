Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :shop do
        resources :categories

        resources :products

      end
    end
  end
end
