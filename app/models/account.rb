class Account < ActiveRecord::Base
  belongs_to :supplier

  def to_bhf_s
    account_number
  end
end
