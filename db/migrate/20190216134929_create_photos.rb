class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :flight_winner
      t.string :winners_image
      t.string :which_flight

      t.timestamps
    end
  end
end
