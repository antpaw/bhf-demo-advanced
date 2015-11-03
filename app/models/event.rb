class Event < ActiveRecord::Base
  
  default_scope -> {order 'starts_at ASC'}
    
  belongs_to :location
  
  validates_length_of :title, minimum: 3
  
  def starts_at
    super || Date.today + 18.hours
  end

  def to_bhf_s
    I18n.l(starts_at, format: '%e. %B %Y') + ' - ' + title.to_s
  end
  
end
