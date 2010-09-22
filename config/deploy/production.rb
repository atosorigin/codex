role :app, "atos-proto0.headshift.com"
role :web, "atos-proto0.headshift.com"
role :db,  "atos-proto0.headshift.com", :primary => true

set :deploy_to, "/srv/rails/#{application}"
set :rails_env, "production"
