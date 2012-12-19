class Addcolumntocommissions < ActiveRecord::Migration
  def up
  	add_column :commissions, :name, :string
  end

  def down
  	remove_column :commissions, :name, :string
  end
end
