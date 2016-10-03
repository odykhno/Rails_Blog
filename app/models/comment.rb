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

  validates :text, presence: true

  after_create :publish_comment

  private

  def publish_comment
    Pusher.trigger('comments', 'new', self.as_json)
  end
end
