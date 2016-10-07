module Api
  class UsersController < ApplicationController
    skip_before_action :authenticate!, only: [:sign_in]

    def sign_in
      @user = User.find_by(email: params[:email], provider: params[:provider])
      render json: { auth_token: @user.generate_session_token! }
    end

    def sign_out
      current_session.destroy
      render json: { success: true }
    end
  end
end