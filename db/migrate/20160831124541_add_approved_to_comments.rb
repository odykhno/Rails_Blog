class AddApprovedToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :approved, :boolean, default: false
  end
end
