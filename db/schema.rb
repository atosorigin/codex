# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101011142207) do

  create_table "accounts", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "address",    :null => false
    t.string   "postcode",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apis", :force => true do |t|
    t.string   "controller"
    t.string   "method"
    t.string   "url"
    t.text     "description"
    t.text     "response"
    t.text     "jquery"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "destination_exceptions", :force => true do |t|
    t.string  "country_code",  :null => false
    t.string  "from_postcode", :null => false
    t.string  "to_postcode",   :null => false
    t.string  "product_code",  :null => false
    t.string  "feature_code",  :null => false
    t.integer "gazetteer_id",  :null => false
  end

  add_index "destination_exceptions", ["feature_code"], :name => "index_destination_exceptions_on_feature_code"
  add_index "destination_exceptions", ["product_code"], :name => "index_destination_exceptions_on_product_code"

  create_table "destination_stations", :force => true do |t|
    t.string  "country_code",              :null => false
    t.string  "from_postcode",             :null => false
    t.string  "to_postcode",               :null => false
    t.string  "product_code",              :null => false
    t.float   "from_weight",               :null => false
    t.float   "to_weight",                 :null => false
    t.integer "service_control_reamus_id"
    t.integer "hub_reamus_id"
    t.integer "gazetteer_id",              :null => false
  end

  add_index "destination_stations", ["hub_reamus_id"], :name => "index_destination_stations_on_hub_reamus_id"
  add_index "destination_stations", ["service_control_reamus_id"], :name => "index_destination_stations_on_service_control_reamus_id"

  create_table "gazetteers", :force => true do |t|
    t.string  "version",                    :null => false
    t.boolean "active",  :default => false, :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "payment_status"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parcels", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "postcodes", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reamuses", :force => true do |t|
    t.string  "reamus_code",   :null => false
    t.string  "location_name", :null => false
    t.string  "opunit",        :null => false
    t.string  "country_code",  :null => false
    t.integer "gazetteer_id",  :null => false
  end

  create_table "service_exchanges", :force => true do |t|
    t.string  "service_id",            :null => false
    t.string  "service_description",   :null => false
    t.string  "product_line_1",        :null => false
    t.string  "product_line_2",        :null => false
    t.string  "product_code",          :null => false
    t.string  "date_code",             :null => false
    t.string  "day_text",              :null => false
    t.string  "time_code",             :null => false
    t.string  "time_text",             :null => false
    t.string  "handling_feature_text", :null => false
    t.string  "feature_id",            :null => false
    t.string  "feature_code",          :null => false
    t.string  "file_type",             :null => false
    t.string  "consignment_flag",      :null => false
    t.string  "ds_flag",               :null => false
    t.integer "gazetteer_id",          :null => false
  end

  create_table "station_product_features", :force => true do |t|
    t.integer "service_control_reamus_id", :null => false
    t.string  "product_code",              :null => false
    t.string  "feature_code",              :null => false
    t.string  "allowed",                   :null => false
    t.integer "gazetteer_id",              :null => false
  end

  add_index "station_product_features", ["feature_code"], :name => "index_station_product_features_on_feature_code"
  add_index "station_product_features", ["product_code"], :name => "index_station_product_features_on_product_code"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
