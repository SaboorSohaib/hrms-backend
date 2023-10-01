class AddUseridToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :user, foreign_key: true, null: false
  end
end
