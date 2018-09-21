class AddFieldsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :event_title, :string
    add_column :events, :event_date, :date
    add_column :events, :event_cost, :decimal
    add_column :events, :event_location, :string
    add_column :events, :event_start_time, :time
    add_column :events, :event_winner, :string
    add_column :events, :winners_picture, :string
  end
end
