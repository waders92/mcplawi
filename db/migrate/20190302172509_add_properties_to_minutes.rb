class AddPropertiesToMinutes < ActiveRecord::Migration[5.0]
  def change
    add_column :minutes, :title, :string
    add_column :minutes, :description, :string
    add_column :minutes, :pdf_file, :string
  end
end
