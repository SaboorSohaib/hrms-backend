class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.date :starting_date
      t.date :ending_date
      t.string :type
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
