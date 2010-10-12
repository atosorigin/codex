ActionController::Routing::Routes.draw do |map|
  map.resources :apis

  map.resources :apis

  map.resources :apis

  map.resources :apis

  map.resources :apis

  map.resources :apis

  map.resources :ap_is


  path_string_regex = /[a-zA-Z0-9_\s%\-\:\(\)]+/
  map.resources :tasks

  # refer to this page for the discussion document on the codex
  # http://charlotte.jira.com/wiki/display/infofabric/codex+api+-+work+in+progress
  
  # postcodes
  map.products  '/postcodes',                        :controller => 'postcodes', :action => 'index'
  map.connect   '/postcodes/:postcode/depots',       
    :controller => 'postcodes',
    :action => 'depots',
    :postcode => path_string_regex
  map.connect   '/postcodes/:postcode/products',     
    :controller => 'postcodes',
    :action => 'products',
    :postcode => path_string_regex
  map.connect   '/postcodes/:postcode',              
    :controller => 'postcodes',
    :action => 'show',
    :postcode => path_string_regex

  # products
  map.products  '/products',                 :controller => 'products', :action => 'index'
  map.connect   '/products/:product_name',  
    :controller => 'products',
    :action => 'show',
    :product_name => path_string_regex

  # accounts
  map.accounts_create   '/accounts',
    :controller => 'accounts',
    :action => "create",
    :conditions => { :method => :post }
  map.accounts  '/accounts',                  
    :controller => 'accounts',
    :action => 'index'
  map.connect   '/accounts/new',
    :controller => 'accounts',
    :action => "new"
  map.connect   '/accounts/:account_name',   
    :controller => 'accounts',
    :action => 'show',
    :account_name => path_string_regex

  # users
  map.connect     '/accounts/:account_name/users',
    :controller => 'users',
    :action => 'create',
    :account_name => path_string_regex,
    :conditions => { :method => :post }
  map.users     '/accounts/:account_name/users',                   
    :controller => 'users',
    :action => 'index',
    :account_name => path_string_regex
  map.connect   '/accounts/:account_name/users/:username',
    :controller => 'users',
    :action => 'destroy',
    :account_name => path_string_regex,
    :username => path_string_regex,
    :conditions => { :method => :delete }
  map.connect   '/accounts/:account_name/users/:username',
    :controller => 'users',
    :action => 'show',
    :account_name => path_string_regex,
    :username => path_string_regex

  # locations
  map.connect     '/accounts/:account_name/locations',
    :controller => 'locations',
    :action => 'create',
    :account_name => path_string_regex,
    :conditions => { :method => :post }
  map.connect   '/accounts/:account_name/locations/:location',
    :controller => 'locations',
    :action => 'destroy',
    :account_name => path_string_regex,
    :location => path_string_regex,
    :conditions => { :method => :delete }
  map.connect   '/accounts/:account_name/locations/:location',
    :controller => 'locations',
    :action => 'show',
    :account_name => path_string_regex,
    :location => path_string_regex
  map.locations     '/accounts/:account_name/locations',
    :controller => 'locations',
    :action => 'index',
    :account_name => path_string_regex
  map.connect   '/accounts/:account_name/locations/:location/manifest',
    :controller => 'locations',
    :action => 'manifest',
    :account_name => path_string_regex,
    :location => path_string_regex

  # parcels
  map.parcels     '/accounts/:accounts_name/parcels',
    :controller => 'parcels',
    :action => 'index',
    :account_name => path_string_regex
  map.connect     '/accounts/:accounts_name/parcels/printed',
    :controller => 'parcels',
    :action => 'printed',
    :account_name => path_string_regex
  map.connect       '/parcels/:parcel_reference/label',
     :controller => 'parcels',
     :action => 'label',
     :parcel_reference => path_string_regex
  map.connect       '/parcels/:parcel_reference',
     :controller => 'parcels',
     :action => 'show',
     :parcel_reference => path_string_regex

  # consignments
  map.consignments     '/accounts/:accounts_name/consignments',
    :controller => 'consignments',
    :action => 'index',
    :account_name => path_string_regex
  map.connect       '/accounts/:accounts_name/consignments/:consignment_id',
     :controller => 'consignments',
     :action => 'show',
     :account_name => path_string_regex,
     :consignment_id => path_string_regex
  map.connect       '/accounts/:accounts_name/consignments/:consignment_id/parcels',
     :controller => 'parcels',
     :action => 'consignment',
     :account_name => path_string_regex,
     :consignment_id => path_string_regex

  # orders
  map.orders     '/accounts/:accounts_name/orders',
    :controller => 'orders',
    :action => 'index',
    :account_name => path_string_regex
  map.connect   '/orders/:order_reference',
    :controller => 'orders',
    :action => 'show',
    :order_reference => path_string_regex

  #default route
  map.root :controller => "products", :action => "index"

end
