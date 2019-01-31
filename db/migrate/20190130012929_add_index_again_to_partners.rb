class AddIndexAgainToPartners < ActiveRecord::Migration[5.0]
  def change
    add_index :partners, :user_id
  end
end
