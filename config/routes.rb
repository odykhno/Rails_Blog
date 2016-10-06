Rails.application.routes.draw do

  get '/auth/:provider/callback', to: 'sessions#create'

  get 'users/show'
  post 'users/show', to: 'users#save'

  get 'persons/profile'
  patch 'persons/profile', to: 'persons#add_avatar'

  get 'comments/show'
  post 'comments/show', to: 'comments#save'

  get 'tags/:tag', to: 'posts#get_all', as: "tag"

  # namespace :api, defaults: { format: :json } do
  #   resources :posts, only: [:index, :show, :create, :update, :destroy] do
  #   end
  #
  #   resources :users, only: [] do
  #     collection do
  #       post :sign_in
  #     end
  #   end
  # end

  resources :posts do
    resources :comments, only: [:create, :destroy]

    collection do
      get :get_all
    end
    member do
      put :like, to: 'posts#like'
      put :unlike, to: 'posts#unlike'
      post :show, to: 'posts#save'
    end
  end

  devise_for :users
  get 'persons/profile', as: 'user_root'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Blog::Api => '/'
end
