class Location < ActiveRecord::Base
  
  default_scope -> {order 'location_group_id ASC, created_at ASC'}

  
  has_many :events
  
  has_attached_file :logo
    
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
  attr_accessor :logo_destroy
  before_validation do
    avatar.clear if logo_destroy == '1'
  end
  
  scope :active,   -> { where(hidden: false) }
  
  # yes this is some hardcoded logic
  scope :hotels,       -> { where(location_group_id: 1) }
  scope :restaurants,  -> { where(location_group_id: 2) }
  scope :landmarks,    -> { where(location_group_id: 3) }
  
  # used by a bhf's "before_save" hook, because `params` aren't provided in before_save filter
  def add_location_group(params)
    self.location_group_id = if params[:platform] == 'location_hotels'
      1
    elsif params[:platform] == 'location_restaurants'
      2
    else
      3
    end
  end
  
  def is_hotel?
    location_group_id == 1
  end
  
  def apdown_text
    content
  end

  def content_long
    "#{intro} #{hidden_text}"
  end

  def content_short
    intro
  end

  def intro
    split_content[0]
  end

  def hidden_text
    split_content[1]
  end

  def split_content
    return [] if read_attribute(:description).blank?
    read_attribute(:description).split('@@@')
  end

  def content_has_more?
    !hidden_text.blank?
  end
  
  def bhf_can_edit?(options)
    return unless options[:user]
    options[:user].roles.include?(Role.find_identifier('admin'))
  end

  
end