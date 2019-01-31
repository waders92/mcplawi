class AddIndexToPartnersOnEvent < ActiveRecord::Migration[5.0]
  def change
    add_index :partners, :event_id
  end
end
