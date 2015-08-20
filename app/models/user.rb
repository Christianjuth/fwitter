class User < ActiveRecord::Base
  # Table links
  has_many :tweets

  # Validators
  validates :username, 
    presence: true, 
    format: { with: /\A([a-z]|[1-9])+\Z/i,
    message: "user letters and numbers only" }

  validates :email, 
    presence: true, 
    format: { with: /.+@.+\..+/i,
    message: "Email is not valid" }
end