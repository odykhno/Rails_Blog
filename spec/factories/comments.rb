# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  author     :string
#  text       :string
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  approved   :boolean          default(FALSE)
#

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
