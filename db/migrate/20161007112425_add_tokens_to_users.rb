class AddTokensToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :tokens, :text
  end
end
