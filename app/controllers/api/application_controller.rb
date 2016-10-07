module Api
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    skip_before_action :verify_authenticity_token
    before_action :authenticate!

    rescue_from ActionController::ParameterMissing do
      render(json: { error: 'Empty token' })
    end

    private

    def current_user
      @current_user ||= current_session.try(:user)
    end

    def current_session
      @current_session ||= begin
        session = Session.where('updated_at > ?', 1.hour.ago)
                      .find_by(token: params[:auth_token])
        session.touch if session.present?
        session
      end
    end

    def authenticate!
      check_auth_token!
      render(json: { error: 'Unauthorized!' }) if current_user.blank?
    end

    def check_auth_token!
      params.require(:auth_token)
    end
  end
end