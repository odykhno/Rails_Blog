class CreateNewComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :author
      t.string :text
      t.integer :post_id

      t.timestamps
    end
    add_index :comments, :post_id
  end
end
