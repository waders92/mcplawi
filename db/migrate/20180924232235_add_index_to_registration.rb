class AddIndexToRegistration < ActiveRecord::Migration[5.0]
  def change
    add_index :registrations, [:user_id, :event_id]
    add_index :registrations, :event_id
  end
end
