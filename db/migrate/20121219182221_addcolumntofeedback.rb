class Addcolumntofeedback < ActiveRecord::Migration
  def up
  	add_column :feedbacks, :name, :string
  end

  def down
    remove_column :feedbacks, :name, :string
  end
end
