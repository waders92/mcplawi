class ChangeTimeToString < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :event_start_time, :string
  end
end
