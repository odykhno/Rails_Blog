class SessionsController < ApplicationController
  before_action :set_user

  @@counter = 0

  def create
    @user.update(picture: auth_hash['info']['image'],
                 name: auth_hash['info']['name'],
                 email: auth_hash['info']['email'] || 'wrong' + @@counter.to_s + '@mail.ru')
    @@counter += 1
    sign_in @user
    redirect_to persons_profile_path
  end

  private

  def set_user
    @user = User.find_or_initialize_by(provider: auth_hash['provider'], provider_id: auth_hash['uid'])
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end