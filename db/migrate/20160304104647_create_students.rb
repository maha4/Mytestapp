class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :gender
      t.string :bio

      t.timestamps null: false
    end
  end
end
