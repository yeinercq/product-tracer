Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :zones do
    resources :farms, except: [:index] do
      collection do
        get :states
        get :cities
      end
    end
  end
end
