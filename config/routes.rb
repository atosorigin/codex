ActionController::Routing::Routes.draw do |map|

  # refer to this page for the discussion document on the codex
  # http://charlotte.jira.com/wiki/display/infofabric/codex+api+-+work+in+progress
  

#  map.resources :users do |user|
#    user.resources :order
#  end
#  map.resources :user, :has_many => :orders
#  map.resources :order


#  map.connect ':controller/:action/:id'
#  map.connect ':controller/:action/:id.:format'

  map.products  '/products',                :controller => 'products', :action => 'index'
  map.connect   '/products/:product_name',  :controller => 'products', :action => 'show',  :product_name => /[a-zA-Z0-9 _]+/

  map.users     '/users',                   :controller => 'users', :action => 'index'
  map.connect   '/users/:user_name',        :controller => 'users', :action => 'show',  :user_name => /[a-zA-Z0-9 _]+/

  map.orders    '/users/:user_name/orders',             :controller => 'orders', :action => 'index',  :user_name => /[a-zA-Z0-9 _]+/
  map.connect   '/users/:user_name/orders/:order_id',   :controller => 'orders', :action => 'show',   :user_name => /[a-zA-Z0-9 _]+/,   :order_id => /[0-9]+/

  map.root :controller => "products", :action => "index"

end
