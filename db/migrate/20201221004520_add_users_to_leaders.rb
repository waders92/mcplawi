class AddUsersToLeaders < ActiveRecord::Migration[5.0]
  def change
    add_column :leaders, :user_id, :integer
  end
end
