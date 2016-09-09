FactoryGirl.define do
  factory :post1, class: Post do
    title "First post"
    text  "My name is Olena"
  end

  factory :post2, class: Post do
    title "Second post"
    text  "My name is Kira"
  end
end