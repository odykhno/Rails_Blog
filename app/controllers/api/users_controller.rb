module Api
  class UsersController < ApplicationController
    def sign_in
      @user = User.find_by(email: params[:email], provider: params[:provider])
      render json: { auth_token: @user.try(:id) }
    end
  end
end