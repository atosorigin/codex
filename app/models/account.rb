class Account < ActiveRecord::Base
  
  #http://charlotte.jira.com/wiki/display/infofabric/Account+and+Parcel+numbering

  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :postcode

  has_many :users

end
