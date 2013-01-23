class AddColumnRequiredSkillsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :required_skills, :string
  end
end
