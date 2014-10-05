class CreateRecieveTexts < ActiveRecord::Migration
  def self.up
    create_table :recieve_texts do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :recieve_texts
  end
end
