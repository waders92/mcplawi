class Add < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :winning_score, :integer
  end
end
