class AddColumnToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :title, :string
    add_column :requests, :group, :string
    add_column :requests, :location, :string
    add_column :requests, :relevant_skills, :string
  end
end
