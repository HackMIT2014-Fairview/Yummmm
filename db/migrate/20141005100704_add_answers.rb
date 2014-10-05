class AddAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.string :response
      t.string :from

      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
