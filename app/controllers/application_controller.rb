class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method              :user_email_or_name

  def if_no_admin
    render(file: 'public/422.html', status: :unauthorized) unless current_user.admin
  end

  def if_blocked_user
    render(file: 'public/422.html', status: :blocked) if current_user.blocked
  end

  def user_email_or_name(user)
    user.email == "wrong@mail.ru" ? user.name : user.email
  end

  def set_search
    @q = Post.search(params[:q])
  end
end
