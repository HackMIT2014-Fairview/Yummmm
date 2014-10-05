class AddPhoneNumbers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      add_column :users, :phone_number, :string
      add_column :users, :subject, :string
      add_column :users, :score, :integer
      add_column :users, :max_score, :integer
      remove_column :users, :email
      remove_column :users, :admin
      remove_column :users, :salt
    end
  end

  def self.down
    change_table :users do |t|
      remove_column :users, :phone_number
      remove_column :users, :subject
      remove_column :users, :score
      remove_column :users, :max_score
      add_column :email, :string
      add_column :users, :admin, :boolean, :default => false
      add_column :users, :salt, :string
      add_index :users, :email, :unique => true
    end
  end
end
