class Rename < ActiveRecord::Migration[5.0]
  def change
    rename_column :notes, :event_update, :event_pdf
  end
end
