Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :foods
      resources :meals, only: [:index]
      namespace :meals do
        get '/:id/foods', to: 'foods#index'
      end
    end
  end
end
