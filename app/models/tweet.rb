class Tweet < ActiveRecord::Base
  belongs_to :user

  # validates :user_id, 
  #   presence: true

  # validates :msg,
  #   presence: true,
  #   length: { minimum: 5, maximum: 140,
  #   message: "enter 5 to 140 characters" }
end