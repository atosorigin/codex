class Order < ActiveRecord::Base
  belongs_to :user
  
  attr_accessor :order_reference
  
end
