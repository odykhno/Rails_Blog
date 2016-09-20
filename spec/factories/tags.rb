# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :tag1, class: Tag do
    name "name"
  end

  factory :tag2, class: Tag do
    name "Olena"
  end
end
