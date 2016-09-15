class PersonsController < ApplicationController
  def profile
  end

  def add_avatar
    unless params[:user].nil?
      current_user.avatar = params[:user][:avatar]
      current_user.save
    else
      flash[:message] = "Please, attach the file"
    end
    redirect_to persons_profile_path
  end
end
