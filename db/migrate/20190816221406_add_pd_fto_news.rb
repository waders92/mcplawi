class AddPdFtoNews < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :event_update, :string
  end
end
