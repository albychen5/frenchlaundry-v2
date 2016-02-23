class AddUserNameAndPhoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_name, :string
    add_column :users, :phone_number, :string

    add_index :users, [:user_name, :phone_number], unique: true
  end
end
