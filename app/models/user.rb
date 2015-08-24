class User < ActiveRecord::Base
  # Table links
  has_many :tweets

  # Validators
  validates_uniqueness_of :username, :on => :create
  validates :username, 
    presence: true, 
    format: { with: /\A([a-z]|[1-9])+\Z/i,
    message: "use letters and numbers only" }

	validates_uniqueness_of :email, :on => :create
  validates :email, 
    presence: true, 
    format: { with: /\S+@\S+\.\S+/i,
    message: "email is not valid" }
end