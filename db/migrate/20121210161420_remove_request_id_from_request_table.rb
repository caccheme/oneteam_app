class RemoveRequestIdFromRequestTable < ActiveRecord::Migration
  def up
    remove_column :requests, :request_id
  end

  def down
    add_column :requests, :request_id, :integer
  end
end
