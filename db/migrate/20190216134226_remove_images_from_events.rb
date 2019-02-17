class RemoveImagesFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :winners_picture
    remove_column :events, :image_caption
    remove_column :events, :event_winner
  end
end
