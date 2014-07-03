class Static < ActiveRecord::Base
  
  belongs_to :static_group

  default_scope -> { order 'slug ASC' }

  has_one :navigation

  validates_presence_of :slug
  validates_uniqueness_of :slug
  
  def to_bhf_s
    "#{title} - #{slug}"
  end

  def bhf_can_edit?(options)
    return unless options[:user]
    options[:user].roles.include?(Role.find_identifier('admin'))
  end

end
