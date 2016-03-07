class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :patient_name
      t.string :disease
      t.string :contact
      t.string :patient_email

      t.timestamps null: false
    end
  end
end
