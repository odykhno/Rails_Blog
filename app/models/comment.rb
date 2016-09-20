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

class Comment < ApplicationRecord
  belongs_to :post
end
