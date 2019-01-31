class AddIndedtoUsersbyParers < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :partner_id
  end
end
