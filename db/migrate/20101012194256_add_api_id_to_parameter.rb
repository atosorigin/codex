class AddApiIdToParameter < ActiveRecord::Migration
  def self.up
    add_column :parameters, :api_id, :integer
  end

  def self.down
    remove_column :parameters, :api_id
  end
end
