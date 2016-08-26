Rails.application.routes.draw do
  get 'users/show'
  post 'users/show', to: 'users#save'
  # post 'users/show', to: :save

  get 'persons/profile'

  resources :posts do
    collection do
      get :get_all
    end
  end

  devise_for :users
  get 'persons/profile', as: 'user_root'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
