class AddCurrentSkillstoEmployees < ActiveRecord::Migration
  def up
  	add_column :employees, :current_skills, :string
  	remove_column :employees, :skills, :string
  end

  def down
  	remove_column :employees, :current_skills, :string
  	add_column :employees, :skills, :string
  end
end
