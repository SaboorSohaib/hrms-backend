class CreateJobInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :job_infos do |t|
      t.string :job_title
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
