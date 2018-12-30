class AddImageCaptionToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :image_caption, :string
  end
end
