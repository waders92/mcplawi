class UpdatePartnersForPolymorphic < ActiveRecord::Migration[5.0]
  def change
    add_column :partners, :partnerable_id, :integer
    add_column :partners, :partnerable_type, :string
  end
end
