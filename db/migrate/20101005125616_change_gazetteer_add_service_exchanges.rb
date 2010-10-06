class ChangeGazetteerAddServiceExchanges < ActiveRecord::Migration
  def self.up
    create_table :service_exchanges do |table|
      table.string :service_id, :null => false
      table.string :service_description, :null => false
      table.string :product_line_1, :null => false
      table.string :product_line_2, :null => false
      table.string :product_code, :null => false
      table.string :date_code, :null => false
      table.string :day_text, :null => false
      table.string :time_code, :null => false
      table.string :time_text, :null => false
      table.string :handling_feature_text, :null => false
      table.string :feature_id, :null => false
      table.string :feature_code, :null => false
      table.string :file_type, :null => false
      table.string :consignment_flag, :null => false
      table.string :ds_flag, :null => false
      table.integer :gazetteer_id, :null => false

      table.index :product_code
      table.index :feature_code
      table.index :gazetteer_id
    end
  end

  def self.down
    drop_table :service_exchanges
  end

end
