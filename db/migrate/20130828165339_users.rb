class Users < ActiveRecord::Migration
  def change
    create_table :users do |u|
      u.string :user_name
      u.string :password
      u.timestamps
    end

    add_index :users, :user_name, :unique => true
  end
end
