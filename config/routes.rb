Rails.application.routes.draw do

  get 'users/show'
  post 'users/show', to: 'users#save'

  get 'persons/profile'
  get 'comments/show'

  resources :posts do
    resources :comments, only: [:create, :destroy]

    collection do
      get :get_all
    end
    member do
      post :show, to: 'posts#save'
    end
  end

  devise_for :users
  get 'persons/profile', as: 'user_root'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
