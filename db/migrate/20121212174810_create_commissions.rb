class CreateCommissions < ActiveRecord::Migration
  def change
    create_table :commissions do |t|
      t.integer :request_id
      t.integer :developer_id

      t.timestamps
    end
  end
end
