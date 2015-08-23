class Hashtag < ActiveRecord::Base
	has_many :tweets_hashtags
  has_many :tweets, :through => :tweets_hashtags
end