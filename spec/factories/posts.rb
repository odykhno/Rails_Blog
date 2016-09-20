# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  moderation :boolean          default(FALSE)
#  slug       :string
#

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
