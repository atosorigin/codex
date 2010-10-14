class AddApiNameToApis < ActiveRecord::Migration
  def self.up
    add_column :apis, :apiname, :string
  end

  def self.down
    remove_column :apis, :apiname
  end
end
