class AddIndexQuestionsTable < ActiveRecord::Migration
  def self.up
    add_index :questions, :prompt, :unique => true
  end

  def self.down
    remove_index :questions, :prompt
  end
end
