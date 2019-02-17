class AddTreasurerToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :isTreasurer, :boolean
  end
end
