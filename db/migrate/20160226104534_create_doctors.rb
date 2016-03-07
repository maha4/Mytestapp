class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :doctor_name
      t.integer :years_of_experience
      t.string :doctor_email

      t.timestamps null: false
    end
  end
end
