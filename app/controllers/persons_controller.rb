class PersonsController < ApplicationController
  def profile
  end

  def add_avatar
    current_user.avatar = params[:user][:avatar]
    current_user.save
    redirect_to persons_profile_path
  end
end
