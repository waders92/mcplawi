class AdjustTeeTimesModel < ActiveRecord::Migration[5.0]
  def change
    change_column :teetimes, :team_tee_time, :string
    add_column :teetimes, :title, :string
    add_column :teetimes, :date, :date
  end
end
