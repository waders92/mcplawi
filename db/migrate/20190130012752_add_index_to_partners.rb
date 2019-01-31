class AddIndexToPartners < ActiveRecord::Migration[5.0]
  def change
    add_column :partners, :user_id, :integer
  end
end
