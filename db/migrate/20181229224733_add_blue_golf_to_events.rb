class AddBlueGolfToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :blue_golf_link, :string
  end
end
