class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :request_id
      t.string :description
      t.string :request_status
      t.integer :developer_id
      t.string :developer_email

      t.timestamps
    end
  end
end
