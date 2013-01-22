class Addcolumnskillstoemployees < ActiveRecord::Migration
  def up
   	add_column :employees, :skills, :string
  end

  def down
   	remove_column :employees, :skills, :string
  end
end
