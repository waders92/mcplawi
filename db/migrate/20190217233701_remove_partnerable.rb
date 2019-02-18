class RemovePartnerable < ActiveRecord::Migration[5.0]
  def change
    remove_column :partners, :partnerable_id
    remove_column :partners, :partnerable_type
  end
end
