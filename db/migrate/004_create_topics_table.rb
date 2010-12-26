class CreateTopicsTable < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.string :name
      t.text :description
      t.text :url
    end
  end

  def self.down
    drop_table :topics
  end
end