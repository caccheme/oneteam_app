class AddStartAndEndTimesToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :start_date, :string
    add_column :requests, :end_date, :string
  end
end
