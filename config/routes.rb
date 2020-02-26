Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :posts do
    member do 
      get :toggle_like
    end
    resources :comments do
      member do
        get :subcomment
      end
    end
  end
end