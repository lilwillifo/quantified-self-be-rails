Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :foods
      resources :meals, only: [:index]
      namespace :meals do
        get '/:id/foods', to: 'foods#index'
        post '/:id/foods/:food_id', to: 'food_meals#create'
        delete '/:id/foods/:food_id', to: 'food_meals#destroy'
      end
    end
  end
end
