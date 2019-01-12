class AddPricesToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :event_cost_non_mcpla, :decimal
  end
end
