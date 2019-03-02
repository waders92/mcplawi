class AddDateToMinutes < ActiveRecord::Migration[5.0]
  def change
    add_column :minutes, :date, :date
  end
end
