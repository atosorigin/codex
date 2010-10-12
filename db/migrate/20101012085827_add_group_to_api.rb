class AddGroupToApi < ActiveRecord::Migration
  def self.up
    add_column :apis, :businessgroup, :string
  end

  def self.down
    remove_column :apis, :businessgroup
  end
end
