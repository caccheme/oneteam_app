class Changecolumnsinrequests < ActiveRecord::Migration
  def up
  	remove_column :requests, :start_date, :string
  	remove_column :requests, :end_date, :string
  	add_column :requests, :start_date, :date
  	add_column :requests, :end_date, :date
  end

  def down
  	remove_column :requests, :start_date, :date
  	remove_column :requests, :end_date, :date
  	add_column :requests, :start_date, :string
  	add_column :requests, :end_date, :string
  end
end
