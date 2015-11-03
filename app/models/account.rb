class Account < ActiveRecord::Base
  has_one :supplier
end
