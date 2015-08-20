class Tweet < ActiveRecord::Base
  validates :username, 
    presence: true, 
    format: { with: /\A([a-z]|[1-9])+\Z/i,
    message: "user letters and numbers only" }

  validates :mes,
    presence: true,
    length: { minimum: 10, maximum: 140,
    message: "enter 10 to 140 characters" }
end