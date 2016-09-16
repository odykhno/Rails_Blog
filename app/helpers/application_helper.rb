module ApplicationHelper
  def user_email_or_name(user)
    user.email == "wrong@mail.ru" ? user.name : user.email
  end
end
