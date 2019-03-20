class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.text :note_update
      t.integer :user_id
      t.timestamps
    end
  end
end
