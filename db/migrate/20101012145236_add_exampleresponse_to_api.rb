class AddExampleresponseToApi < ActiveRecord::Migration
  def self.up
    add_column :apis, :exampleresponse, :text
  end

  def self.down
    remove_column :apis, :exampleresponse
  end
end
