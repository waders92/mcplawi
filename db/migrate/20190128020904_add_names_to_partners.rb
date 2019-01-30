class AddNamesToPartners < ActiveRecord::Migration[5.0]
  def change
    add_column :partners, :first_name, :string
    add_column :partners, :last_name, :string
  end
end
