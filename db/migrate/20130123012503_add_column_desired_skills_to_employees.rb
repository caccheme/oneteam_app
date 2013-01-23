class AddColumnDesiredSkillsToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :desired_skills, :string
  end
end
