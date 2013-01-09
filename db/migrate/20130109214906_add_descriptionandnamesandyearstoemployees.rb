class AddDescriptionandnamesandyearstoemployees < ActiveRecord::Migration
  def up
  	add_column :employees, :first_name, :string
  	add_column :employees, :last_name, :string
  	add_column :employees, :description, :string
  	change_column :employees, :years_with_company, :integer
  end

  def down
  	remove_column :employees, :first_name, :string
  	remove_column :employees, :last_name, :string
  	remove_column :employees, :description, :string
  	change_column :employees, :years_with_company, :string
  end
end
