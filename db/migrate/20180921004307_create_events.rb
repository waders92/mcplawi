class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events, &:timestamps
  end
end
