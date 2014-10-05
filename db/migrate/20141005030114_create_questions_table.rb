class CreateQuestionsTable < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :type
      t.string :prompt
      t.string :answer
      t.boolean :used
    end
  end
  def self.down
    drop_table :questions
  end
end
