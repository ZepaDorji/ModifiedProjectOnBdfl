Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :shop do
        resources :categories
        resources :products
        resources :category_products
        resources :profiles
      end
    end
  end
end
