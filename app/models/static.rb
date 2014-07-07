class Static < ActiveRecord::Base
  
  def to_bhf_s
    "#{title} / #{id}"
  end

  def bhf_can_edit?(options)
    return unless options[:user]
    options[:user].roles.include?(Role.find_identifier('admin'))
  end

end
