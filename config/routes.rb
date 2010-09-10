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

  map.products     '/products', :controller => "products", :action => "index"

  map.root :controller => "products", :action => "index"

end
