class AddMembershipsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :membership_status, :string

  end
end
