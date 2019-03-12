class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.integer :job_number
      t.text :model_number
      t.text :start_date
      t.text :assigned_employee
      t.text :completion_date
      t.text :team_number

      t.timestamps
    end
  end
end
