require "./app/models/hashtag"
require "./app/models/tweets_hashtag"

class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :tweets_hashtags
  has_many :hashtag, :through => :tweets_hashtags

  validates :user_id, 
    presence: true

  validates :msg,
    presence: true,
    length: { minimum: 5, maximum: 140,
    message: "enter 5 to 140 characters" }

  after_save do |tweet|
    hashtags = tweet.msg.scan(/(?<=#)[a-z0-9]+(?=\s|#|$)/i)
    hashtags.each do |hashtag_string|
      hashtag = Hashtag.find_by({name: hashtag_string})
      unless hashtag
        hashtag = Hashtag.new({name: hashtag_string})
        hashtag.save
      end
      link = Tweets_Hashtag.new({
        tweet_id: tweet.id,
        hashtag_id: hashtag.id
      })
      link.save
    end
  end

  before_destroy do |tweet|
    link = Tweets_Hashtag.find(tweet.id)
    link.destroy
  end
end