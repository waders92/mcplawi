class AddClubsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :home_club, :string
  end
end
