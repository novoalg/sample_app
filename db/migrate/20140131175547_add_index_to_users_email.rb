class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
	add_index :users, :email, :password, :password_confirmation, :unique => true
  end
end
