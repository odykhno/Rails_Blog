module Blog
  class Api < Grape::API
    version 'v1', using: :path
    format :json

    include GrapeTokenAuth::MountHelpers
    include GrapeTokenAuth::TokenAuthentication

    mount_sessions(to: '/auth', for: :user)

    before do
      :authenticate_user!
    end

    resources :posts do
      get do
        posts = Post.all
        present posts, with: PostEntity
      end
    end
  end
end