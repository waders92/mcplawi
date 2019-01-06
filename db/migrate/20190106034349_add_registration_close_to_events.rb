class AddRegistrationCloseToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :registration_close, :date
  end
end
