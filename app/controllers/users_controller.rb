class UsersController < ApplicationController
  before_action :if_no_admin
  # before_action :if_blocked_user

  def show
    @users = User.all
  end

  def save
    @users = User.all
    # binding.pry
    if params[:grant_admin]
      user = User.find_by(id: params[:grant_admin].to_f)
      user.admin = true
      user.save
    elsif params[:grant_admin_hidden]
      user = User.find_by(id: params[:grant_admin_hidden].to_f)
      user.admin = false
      user.save
    end
    if params[:block_user]
      user = User.find_by(id: params[:block_user].to_f)
      user.blocked = true
      user.save
    elsif params[:block_user_hidden]
      user = User.find_by(id: params[:block_user_hidden].to_f)
      user.blocked = false
      user.save
    end
    render 'show'
  end
end