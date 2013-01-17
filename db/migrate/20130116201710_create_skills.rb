class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :PHP
      t.string :MySQL
      t.string :Apache
      t.string :C#
      t.string :Apache
      t.string :Ruby_on_Rails
      t.string :SQL_server
      t.string :Linux

      t.timestamps
    end
  end
end
