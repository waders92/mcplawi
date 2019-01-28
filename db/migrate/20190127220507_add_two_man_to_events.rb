class AddTwoManToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :is_partner_event, :boolean
  end
end
