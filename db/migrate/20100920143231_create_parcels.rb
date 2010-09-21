class CreateParcels < ActiveRecord::Migration
  def self.up
    create_table :parcels do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :parcels
  end
end
