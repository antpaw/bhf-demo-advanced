Bhf.configure do |config|
  
  config.on_login_fail = :login_url
  
  config.abstract_settings << 'abstract'
  
  config.js << 'bhf/extras.js'
  
end