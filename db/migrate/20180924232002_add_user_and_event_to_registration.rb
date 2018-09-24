class AddUserAndEventToRegistration < ActiveRecord::Migration[5.0]
  def change
    add_column :registrations, :user_id, :integer
    add_column :registrations, :event_id, :integer
  end
end
