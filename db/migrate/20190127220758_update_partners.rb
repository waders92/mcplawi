class UpdatePartners < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :is_partner_event, :boolean, :default => false
  end
end
