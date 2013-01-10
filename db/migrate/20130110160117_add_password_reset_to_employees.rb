class AddPasswordResetToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :password_reset_token, :string
    add_column :employees, :password_reset_sent_at, :datetime
  end
end
