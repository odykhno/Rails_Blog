FactoryGirl.define do
  factory :comment1, class: Comment do
    text  "The first comment"
  end

  factory :comment2, class: Comment do
    text "The second comment"
  end

  factory :comment3, class: Comment do
    text "The third comment"
  end

  factory :comment4, class: Comment do
    text "The fourth comment"
  end
end