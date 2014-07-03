class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::Sha512
  end
  
  has_and_belongs_to_many :teams
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :roles
  
  validates_presence_of :email
  validates_uniqueness_of :email
  # validates_format_of :email, with: EMAIL_REG
  
  validates_presence_of     :password, if: :password_required?
  validates_confirmation_of :password, if: :password_required?
  
  validate :cannot_edit_demo_user

  def cannot_edit_demo_user
    if id == 1
      errors.add(:cannot_edit_demo_user, 'select a different user')
    end
  end
  
  
  def password_required?
    crypted_password.blank?
  end
  
  def my_hotels # if the user isn't a admin this the scope will only show many_to_many location-hotels
    (has_role? ? Location : locations).hotels
  end
  def my_restaurants
    (has_role? ? Location : locations).restaurants
  end
  def my_landmarks
    (has_role? ? Location : locations).landmarks
  end
  
  def has_role?(role_name = 'admin')
    roles.include?(Role.find_identifier(role_name))
  end
  
  def bhf_roles # namespaced roles, lets you add more logic if needed
    roles
  end
end
