class CreateTeetimes < ActiveRecord::Migration[5.0]
  def change
    create_table :teetimes do |t|
      t.text :team_tee_time
      t.integer :user_id

      t.timestamps
    end
  end
end
