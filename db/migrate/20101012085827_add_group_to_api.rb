class AddGroupToApi < ActiveRecord::Migration
  def self.up
    add_column :apis, :group, :string
  end

  def self.down
    remove_column :apis, :group
  end
end
