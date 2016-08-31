class AddModerationToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :moderation, :boolean, default: false
  end
end
