User.delete_all
Location.delete_all
Event.delete_all
Role.delete_all

[:users, :roles, :locations, :events].each do |table|
  ActiveRecord::Base.connection.execute("DELETE from roles_users WHERE 1 = 1")
  ActiveRecord::Base.connection.execute("DELETE from locations_users WHERE 1 = 1")
  if Rails.env.production?
    ActiveRecord::Base.connection.reset_pk_sequence!(table)
  else
    ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = '#{table}'")
  end
end

User.create([
  {
    name: 'Bhf Test User', 
    login: 'admin',
    email: 'test@bhfgem.com', 
    password: 'bhf_pw', 
    password_confirmation: 'bhf_pw'
  
  }
])
Role.create([
  {
    identifier: 'events',
    name: 'Events'
  },
  {
    identifier: 'locations',
    name: 'Locations'
  },
  {
    identifier: 'admin',
    name: 'Admin'
  }
])

u = User.find(1)
u.roles << Role.find(1)
u.roles << Role.find(2)
u.roles << Role.find(3)
u.save

