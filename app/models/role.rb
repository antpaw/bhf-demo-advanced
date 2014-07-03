class Role < ActiveRecord::Base
  
  default_scope -> {order 'position DESC'}

  has_and_belongs_to_many :users
  validates_uniqueness_of :name
  validates_presence_of :name
  
  def self.find_identifier(name)
    where(identifier: name).first
  end
  
  
end
