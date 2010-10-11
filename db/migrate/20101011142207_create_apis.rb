class CreateApis < ActiveRecord::Migration
  def self.up
    create_table :apis do |t|
      t.string :controller
      t.string :method
      t.string :url
      t.text :description
      t.text :response
      t.text :jquery

      t.timestamps
    end
  end

  def self.down
    drop_table :apis
  end
end
