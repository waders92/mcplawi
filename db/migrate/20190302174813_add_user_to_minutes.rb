class AddUserToMinutes < ActiveRecord::Migration[5.0]
  def change
    add_column :minutes, :user_id, :integer
  end
end
