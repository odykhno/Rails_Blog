module Api
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    skip_before_action :verify_authenticity_token

    private

    def current_user
      @user ||= User.find_by(id: params[:auth_token])
    end

    def authenticate!
      render(json: { error: 'Unauthorized!' }) if current_user.blank?
    end
  end
end