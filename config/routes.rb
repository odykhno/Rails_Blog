Rails.application.routes.draw do

  get 'users/show'
  post 'users/show', to: 'users#save'

  get 'persons/profile'
  patch 'persons/profile', to: 'persons#add_avatar'

  get 'comments/show'
  post 'comments/show', to: 'comments#save'

  get 'tags/:tag', to: 'posts#get_all', as: "tag"

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
