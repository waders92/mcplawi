class AddItemsToTeam < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :team_schedule_info, :text
  end
end
