class AddSomeChanges < ActiveRecord::Migration[7.0]
  def change
    change_column :employees, :phone, :string
    rename_column :projects, :duration, :budget
    add_index :salaries, [:employee_id, :month], unique: true
  end
end
