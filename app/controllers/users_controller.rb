class UsersController < ApplicationController
  def show
    @users = User.all
  end

  def save
    # binding.pry
    if params[:grant_admin]
      user = User.find_by(id: params[:grant_admin].to_f)
      user.admin = true
      user.save
    else
      user = User.find_by(id: params[:grant_admin_hidden].to_f)
      user.admin = false
      user.save
    end
    render 'show' # doesn't work
  end
end
