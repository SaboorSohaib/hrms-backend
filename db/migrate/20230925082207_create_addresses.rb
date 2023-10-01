class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :province
      t.string :distract
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
