class CreateGazetteer < ActiveRecord::Migration
  def self.up
    create_table :gazetteers do |table|
      table.string :version, :null => false
      table.boolean :active, :null => false, :default => false

      table.index :version, :unique => true
    end

    create_table :reamuses do |table|
      table.string :reamus_code, :null => false
      table.string :location_name, :null => false
      table.string :opunit, :null => false
      table.string :country_code, :null => false
      table.integer :gazetteer_id, :null => false
      
      table.index :reamus_code
      table.index :gazetteer_id
    end

    create_table :destination_stations do |table|
      table.string :country_code, :null => false
      table.string :from_postcode, :null => false
      table.string :to_postcode, :null => false
      table.string :product_code, :null => false
      table.float :from_weight, :null => false
      table.float :to_weight, :null => false
      table.integer :service_control_reamus_id
      table.integer :hub_reamus_id
      table.integer :gazetteer_id, :null => false

      table.index [:from_postcode, :to_postcode]
      table.index :gazetteer_id
    end

    create_table :station_product_features do |table|
      table.integer :service_control_reamus_id, :null => false
      table.string :product_code, :null => false
      table.string :feature_code, :null => false
      table.string :allowed, :null => false
      table.integer :gazetteer_id, :null => false

      table.index :service_control_reamus_id
      table.index :gazetteer_id
    end

    create_table :destination_exceptions do |table|
      table.string :country_code, :null => false
      table.string :from_postcode, :null => false
      table.string :to_postcode, :null => false
      table.string :product_code, :null => false
      table.string :feature_code, :null => false
      table.integer :gazetteer_id, :null => false

      table.index [:from_postcode, :to_postcode]
      table.index :gazetteer_id
    end

  end

  def self.down
    drop_table :gazetteers
    drop_table :reamuses
    drop_table :destination_stations
    drop_table :station_product_features
    drop_table :destination_exceptions
  end
end
