class ChangeEventStartDate < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :event_date, :event_start_date
  end
end
