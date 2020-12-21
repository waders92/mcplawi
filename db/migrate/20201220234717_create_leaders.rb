class CreateLeaders < ActiveRecord::Migration[5.0]
  def change
    create_table :leaders do |t|
      t.string :category
      t.string :title
      t.string :name
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
