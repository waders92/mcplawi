class AddSeasonPassToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :event_cost_season_pass, :decimal
  end
end
