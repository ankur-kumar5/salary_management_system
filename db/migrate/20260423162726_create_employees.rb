class CreateEmployees < ActiveRecord::Migration[8.0]
  def change
    create_table :employees do |t|
      t.string :full_name
      t.string :job_title
      t.string :country
      t.decimal :salary

      t.timestamps
    end
    add_index :employees, :job_title
    add_index :employees, :country
  end
end
