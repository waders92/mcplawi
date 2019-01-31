class AddIndexForPartnerable < ActiveRecord::Migration[5.0]
  def change
    add_index :partners, [:partnerable_type, :partnerable_id]
  end
end
