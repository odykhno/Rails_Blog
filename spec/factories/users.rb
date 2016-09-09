FactoryGirl.define do
  factory :user do
    email    "user@mail.ru"
    password "123456"
    admin    false
  end

  factory :admin, class: User do
    email    "admin@mail.ru"
    password "123456"
    admin    true
  end
end