class ChangeMonthTypeToString < ActiveRecord::Migration[7.0]
  def change
    change_column :salaries, :month, :string
  end
end
