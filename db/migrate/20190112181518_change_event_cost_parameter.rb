class ChangeEventCostParameter < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :event_cost, :event_cost_mcpla
  end
end
