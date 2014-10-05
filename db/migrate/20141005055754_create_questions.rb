class CreateQuestions < ActiveRecord::Migration
  def self.up
    change_table :questions do |t|

      t.timestamps
    end
  end

  def self.down
    remove_column :questions, :timestamps
  end
end
