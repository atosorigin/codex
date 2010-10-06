class ChangeGazetteerAddIndexes < ActiveRecord::Migration
  def self.up
    add_index :destination_stations, :service_control_reamus_id
    add_index :destination_stations, :hub_reamus_id

    add_index :station_product_features, :product_code
    add_index :station_product_features, :feature_code

    add_index :destination_exceptions, :product_code
    add_index :destination_exceptions, :feature_code
  end

  def self.down
    remove_index :destination_stations, :service_control_reamus_id
    remove_index :destination_stations, :hub_reamus_id

    remove_index :station_product_features, :product_code
    remove_index :station_product_features, :feature_code

    remove_index :destination_exceptions, :product_code
    remove_index :destination_exceptions, :feature_code
  end
end

