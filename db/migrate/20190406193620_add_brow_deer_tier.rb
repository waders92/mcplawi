class AddBrowDeerTier < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :event_cost_season_pass_browndeer, :decimal
  end
end
