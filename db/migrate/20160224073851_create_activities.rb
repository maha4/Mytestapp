class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :description
      t.float :lat_long

      t.timestamps null: false
    end
  end
end
