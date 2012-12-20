class Addcolumntorequests < ActiveRecord::Migration
  def up
  	add_column :requests, :employee_id, :integer
  end

  def down
  	remove_column :requests, :employee_id, :integer
  end
end
