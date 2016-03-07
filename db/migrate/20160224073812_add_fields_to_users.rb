class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sur_name, :string
    add_column :users, :designation, :string
    add_column :users, :cell_number, :string
    add_column :users, :employee_name, :string
  end
end
