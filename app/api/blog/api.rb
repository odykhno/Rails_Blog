module Blog
  class Api < Grape::API
    version 'v1', using: :path
    format :json

    resources :posts do
      get do
        posts = Post.all
        present posts, with: PostEntity
      end
    end
  end
end