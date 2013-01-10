class AddAuthTokenToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :auth_token, :string
  end
end
