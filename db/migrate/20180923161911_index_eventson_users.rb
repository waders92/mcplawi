class IndexEventsonUsers < ActiveRecord::Migration[5.0]
  def change
    add_index :events, :user_id
  end
end
