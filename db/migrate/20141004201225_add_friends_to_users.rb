class AddFriendsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :friends, :string
  end

  def self.down
    remove_column :users, :friends
  end
end
