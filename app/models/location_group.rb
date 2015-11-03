class LocationGroup < ActiveRecord::Base
  default_scope -> {order 'created_at ASC'}
  
  has_many :locations
  
end