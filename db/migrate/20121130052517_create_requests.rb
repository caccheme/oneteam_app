class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :request_id
      t.string :description
      t.string :status

      t.timestamps
    end
  end
end
