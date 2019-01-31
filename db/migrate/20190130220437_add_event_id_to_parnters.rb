class AddEventIdToParnters < ActiveRecord::Migration[5.0]
  def change
    add_column :partners, :event_id, :integer
  end
end
