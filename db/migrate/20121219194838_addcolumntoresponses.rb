class Addcolumntoresponses < ActiveRecord::Migration
  def up
  	add_column :responses, :employee_name, :string
  end

  def down
    remove_column :responses, :employee_name, :string
  end
end
