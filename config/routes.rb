ActionController::Routing::Routes.draw do |map|

  # refer to this page for the discussion document on the codex
  # http://charlotte.jira.com/wiki/display/infofabric/codex+api+-+work+in+progress
  
  # postcodes
  map.products  '/postcodes',               :controller => 'postcodes', :action => 'index'
  map.connect   '/postcodes/:postcode',     :controller => 'postcodes', :action => 'show',  :postcode => /[a-zA-Z0-9_\s%]+/

  # products
  map.products  '/products',                :controller => 'products', :action => 'index'
  map.connect   '/products/:product_name',  :controller => 'products', :action => 'show',  :product_name => /[a-zA-Z0-9 _]+/

  # users
  map.users     '/users',                   :controller => 'users', :action => 'index'
  map.connect   '/users/:user_name',        :controller => 'users', :action => 'show',  :user_name => /[a-zA-Z0-9 _]+/

  # parcels
  map.parcels       '/users/:user_name/orders/:order_id/consignments/:consignment_id/parcels',
     :controller => 'parcels',
     :action => 'index',
     :user_name => /[a-zA-Z0-9 _]+/,
     :order_id => /[0-9]+/,
     :consignment_id => /[a-zA-Z0-9 _]+/
  map.connect       '/users/:user_name/orders/:order_id/consignments/:consignment_id/parcels/:parcel_id',
     :controller => 'parcels',
     :action => 'show',
     :user_name => /[a-zA-Z0-9 _]+/,
     :order_id => /[0-9]+/,
     :consignment_id => /[a-zA-Z0-9 _]+/,
     :parcel_id => /[a-zA-Z0-9 _]+/
  map.connect       '/users/:user_name/orders/:order_id/consignments/:consignment_id/parcels/:parcel_id/label',
     :controller => 'parcels',
     :action => 'label',
     :user_name => /[a-zA-Z0-9 _]+/,
     :order_id => /[0-9]+/,
     :consignment_id => /[a-zA-Z0-9 _]+/,
     :parcel_id => /[a-zA-Z0-9 _]+/

  # consignments
  map.consignments   '/users/:user_name/orders/:order_id/consignments',
     :controller => 'consignments',
     :action => 'index',
     :user_name => /[a-zA-Z0-9 _]+/,
     :order_id => /[0-9]+/
  map.connect       '/users/:user_name/orders/:order_id/consignments/:consignment_id',
     :controller => 'consignments',
     :action => 'show',
     :user_name => /[a-zA-Z0-9 _]+/,
     :order_id => /[0-9]+/,
     :consignment_id => /[a-zA-Z0-9 _]+/

  # orders
  map.orders    '/users/:user_name/orders',             :controller => 'orders', :action => 'index',  :user_name => /[a-zA-Z0-9 _]+/
  map.connect   '/users/:user_name/orders/:order_id',   :controller => 'orders', :action => 'show',   :user_name => /[a-zA-Z0-9 _]+/,   :order_id => /[0-9]+/

  map.root :controller => "products", :action => "index"

end
