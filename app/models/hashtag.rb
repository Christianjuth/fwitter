class Hashtag < ActiveRecord::Base
  has_many :tweets, :through => :tweets_hashtags
end