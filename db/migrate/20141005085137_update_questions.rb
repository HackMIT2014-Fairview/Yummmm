class UpdateQuestions < ActiveRecord::Migration
  def self.up
    change_table :questions do |t|
      remove_column :questions, :type
      add_column :questions, :subject, :string
    end
  end

  def self.down
    change_table :questions do |t|
      add_column :questions, :type, :string
      remove_column :questions, :subject
    end
  end
end
