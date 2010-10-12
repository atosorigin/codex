class Location < ActiveRecord::Base
  belongs_to :account

  validates_presence_of :name
  validates_length_of :name, :within => 3..40

end
