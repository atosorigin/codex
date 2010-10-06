ActionController::Routing::Routes.draw do |map|

  # refer to this page for the discussion document on the codex
  # http://charlotte.jira.com/wiki/display/infofabric/codex+api+-+work+in+progress
  
  # postcodes
  map.products  '/postcodes',                        :controller => 'postcodes', :action => 'index'
  map.connect   '/postcodes/:postcode/depots',       :controller => 'postcodes', :action => 'depots',  :postcode => /[a-zA-Z0-9_\s%]+/
  map.connect   '/postcodes/:postcode/products',     :controller => 'postcodes', :action => 'products',  :postcode => /[a-zA-Z0-9_\s%]+/
  map.connect   '/postcodes/:postcode',              :controller => 'postcodes', :action => 'show',  :postcode => /[a-zA-Z0-9_\s%]+/

  # products
  map.products  '/products',                :controller => 'products', :action => 'index'
  map.connect   '/products/:product_name',  
    :controller => 'products',
    :action => 'show',
    :product_name => /[a-zA-Z0-9_\s%\-\:]+/

  # accounts
  map.accounts  '/accounts',                  :controller => 'accounts', :action => 'index'
  map.connect   '/accounts/:accounts_name',   :controller => 'accounts',    :action => 'show',  :account_name => /[a-zA-Z0-9 _]+/

  # users
  map.users     '/accounts/:accounts_name/users',                   
    :controller => 'users',
    :action => 'index',
    :account_name => /[a-zA-Z0-9_\s%]+/
  map.connect   '/accounts/:accounts_name/users/:user_name',
    :controller => 'users',
    :action => 'show',
    :account_name => /[a-zA-Z0-9_\s%]+/,
    :user_name => /[a-zA-Z0-9_\s%]+/

  # locations
  map.locations     '/accounts/:accounts_name/locations',
    :controller => 'locations',
    :action => 'index',
    :account_name => /[a-zA-Z0-9_\s%]+/
  map.connect   '/accounts/:accounts_name/locations/:location',
    :controller => 'locations',
    :action => 'show',
    :account_name => /[a-zA-Z0-9_\s%]+/,
    :location => /[a-zA-Z0-9_\s%]+/
  map.connect   '/accounts/:accounts_name/locations/:location/manifest',
    :controller => 'locations',
    :action => 'manifest',
    :account_name => /[a-zA-Z0-9_\s%]+/,
    :location => /[a-zA-Z0-9_\s%]+/

  # parcels
  map.parcels     '/accounts/:accounts_name/parcels',
    :controller => 'parcels',
    :action => 'index',
    :account_name => /[a-zA-Z0-9_\s%]+/
  map.connect     '/accounts/:accounts_name/parcels/printed',
    :controller => 'parcels',
    :action => 'printed',
    :account_name => /[a-zA-Z0-9_\s%]+/
  map.connect       '/parcels/:parcel_reference/label',
     :controller => 'parcels',
     :action => 'label',
     :parcel_reference => /[a-zA-Z0-9_\s%]+/
  map.connect       '/parcels/:parcel_reference',
     :controller => 'parcels',
     :action => 'show',
     :parcel_reference => /[a-zA-Z0-9_\s%]+/

  # consignments
  map.consignments     '/accounts/:accounts_name/consignments',
    :controller => 'consignments',
    :action => 'index',
    :account_name => /[a-zA-Z0-9_\s%]+/
  map.connect       '/accounts/:accounts_name/consignments/:consignment_id',
     :controller => 'consignments',
     :action => 'show',
     :account_name => /[a-zA-Z0-9_\s%]+/,
     :consignment_id => /[a-zA-Z0-9_\s%]+/
  map.connect       '/accounts/:accounts_name/consignments/:consignment_id/parcels',
     :controller => 'parcels',
     :action => 'consignment',
     :account_name => /[a-zA-Z0-9_\s%]+/,
     :consignment_id => /[a-zA-Z0-9_\s%]+/
  #map.consignments   '/users/:user_name/orders/:order_reference/consignments',
  #   :controller => 'consignments',
  #   :action => 'index',
  #   :user_name => /[a-zA-Z0-9_\s%]+/,
  #   :order_reference => /[0-9]+/

  # orders
  map.orders     '/accounts/:accounts_name/orders',
    :controller => 'orders',
    :action => 'index',
    :account_name => /[a-zA-Z0-9_\s%]+/
  #map.orders    '/users/:user_name/orders',
  #  :controller => 'orders',
  #  :action => 'index',
  #  :user_name => /[a-zA-Z0-9_\s%]+/
  #map.connect   '/users/:user_name/orders/:order_reference',
  #  :controller => 'orders',
  #  :action => 'show',
  #  :user_name => /[a-zA-Z0-9_\s%]+/,
  #  :order_reference => /[0-9]+/
  map.connect   '/orders/:order_reference',
    :controller => 'orders',
    :action => 'show',
    :order_reference => /[0-9]+/

  #default route
  map.root :controller => "products", :action => "index"

end
