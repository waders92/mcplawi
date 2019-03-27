class AdjustTeeTimeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :teetimes, :team_tee_time, :teetime_pdf
  end
end
